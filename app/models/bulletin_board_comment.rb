# frozen_string_literal: true

class BulletinBoardComment < ApplicationRecord
  belongs_to :bulletin_board

  validates :comment, presence: true
end
