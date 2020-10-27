# frozen_string_literal: true

class Inquiry < ApplicationRecord
  validates :email, presence: { message: 'メールアドレスを入力してください' }
end
