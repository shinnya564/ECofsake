class Type < ApplicationRecord

	has_many :products

  #DBからユーザー名を検索する
  def Type.search(search)
    Type.where(['name LIKE ?', "%#{search}%"])
  end

end
