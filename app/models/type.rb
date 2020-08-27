class Type < ApplicationRecord

	has_many :products

  validates :name, presence: true, uniqueness: true

  #DBからユーザー名を検索する
  def Type.search(search)
    Type.where(['name LIKE ?', "#{search}"])
  end

end
