class ApplicationMailer < ActionMailer::Base
  	default from: 'heartburn.515@gmail.com'
  	layout 'mailer'

  	def received_email(inquiry)
    	@inquiry = inquiry
  	end

end
