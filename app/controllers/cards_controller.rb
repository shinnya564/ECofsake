# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :authenticate_end_user!

  require 'payjp'

  def index
    @end_user = current_end_user
    @cards = @end_user.cards
    card = Card.where(end_user_id: current_end_user.id).first
  end

  def new
    @end_user = current_end_user
    @card = Card.new
  end

  def card_check # Cardのデータpayjpに送り情報を取り出します
    @end_user = current_end_user
    @card = Card.new
    @number = params[:card_number]
    @exp_year = params[:card_exp_year]
    @exp_month = params[:card_exp_month]
    @cvc = params[:card_cvc]
  end

  def create # クレジットカード登録
    # jay.jpに保存
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.create(
      card: params['payjpToken'],
      metadata: { end_user_id: current_end_user.id }
    )
    @card = Card.new
    @card.end_user_id = current_end_user.id
    @card.customer_id = customer.id
    @card.card_id = customer.default_card
    # dbに保存
    if @card.save
      redirect_to action: 'index'
      flash[:notice] = 'クレジットカードの登録が完了しました'
    else
      redirect_to action: 'new'
      flash[:notice] = 'クレジットカード登録に失敗しました'
    end
  end

  def destroy # PayjpとCardデータベースを削除します
    card = Card.where(end_user_id: current_end_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.destroy
    end
    redirect_to action: 'index'
  end
end
