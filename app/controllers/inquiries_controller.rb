class InquiriesController < ApplicationController

  def new
  	@inquiry = Inquiry.new
    if end_user_signed_in?
      @end_user = current_end_user
    else
    end
  end

  def confirm
  	# 入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      if end_user_signed_in?
        @end_user = current_end_user
      else
      end
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end


  def thanks
  	# メール送信
    @inquiry = Inquiry.new(inquiry_params)
    ApplicationMailer.received_email(@inquiry).deliver
    # 完了画面を表示
    render :action => 'thanks'
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name,:email, :message)
  end
end
