# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'BulletinBoardsモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:bulletin_board) { create(:bulletin_board) }

    context 'titleカラム' do
      it '空欄でないこと' do
        bulletin_board.title = ''
        expect(bulletin_board.valid?).to eq false
      end
    end
    context 'nameカラム' do
      it '空欄でないこと' do
        bulletin_board.name = ''
        expect(bulletin_board.valid?).to eq false
      end
    end
    context 'カラム' do
      it '空欄でないこと' do
        bulletin_board.body = ''
        expect(bulletin_board.valid?).to eq false
      end
    end
  end
end
