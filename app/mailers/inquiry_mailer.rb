class InquiryMailer < ApplicationMailer
	default from: "example@example.com"   # 送信元アドレス
	default to: "example@example.com"     # 送信先アドレス

  	def received_email(inquiry)
    	@inquiry = inquiry
    	mail(
    			to: inquiry.email,
				to: 'heartburn.515@gmail.com',
    			subject: 'お問い合わせがありました'
    		)
  	end
end
