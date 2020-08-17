class Type < ApplicationRecord

	has_many :products

  #DBからユーザー名を検索する
  def Type.search(search, model)
      if model == "2"
        Type.where(['name LIKE ?', "%#{search}%"])
      else
        Type.all
      end
  end

end
