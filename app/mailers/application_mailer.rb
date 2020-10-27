# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'example@example.com'
  layout 'mailer'
end
