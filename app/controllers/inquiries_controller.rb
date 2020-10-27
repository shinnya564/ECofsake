# frozen_string_literal: true

class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
    @end_user = current_end_user if end_user_signed_in?
  end

  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      # OK。確認画面を表示
      render action: 'confirm'
    else
      @end_user = current_end_user if end_user_signed_in?
      # NG。入力画面を再表示
      render action: 'new'
    end
  end

  def thanks
    # メール送信
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
