class Inquiry < ApplicationRecord

	validates :email, :presence => {:message => 'メールアドレスを入力してください'}

end
