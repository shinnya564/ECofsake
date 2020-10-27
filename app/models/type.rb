# frozen_string_literal: true

class Type < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: true

  # DBからユーザー名を検索する
  def self.search(search)
    Type.where(['name LIKE ?', search.to_s])
  end
end
