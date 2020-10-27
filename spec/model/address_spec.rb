# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Addressモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:end_user) { create(:end_user) }
    let!(:address) { build(:address, end_user_id: end_user.id) }

    context 'postal_codeカラム' do
      it '空欄でないこと' do
        address.postal_code = ''
        expect(address.valid?).to eq false
      end
    end
    context 'addressカラム' do
      it '空欄でないこと' do
        address.address = ''
        expect(address.valid?).to eq false
      end
    end
    context 'nameカラム' do
      it '空欄でないこと' do
        address.name = ''
        expect(address.valid?).to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'end_userモデルとの関係' do
      it 'N:1となっている' do
        expect(Address.reflect_on_association(:end_user).macro).to eq :belongs_to
      end
    end
  end
end
