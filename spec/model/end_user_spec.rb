
require 'rails_helper'

RSpec.describe 'EndUserModelTest', type: :model do

  before do
    @end_user = build(:end_user)
  end

  describe 'バリデーション' do
    it 'emailが空だとNG' do
      @end_user.email = ''
      expect(@end_user.valid?).to eq(false)
    end
    it '苗字が空だとNG' do
      @end_user.family_name = ''
      expect(@end_user.valid?).to eq(false)
    end
    it '名前が空だとNG' do
      @end_user.first_name = ''
      expect(@end_user.valid?).to eq(false)
    end
    it 'ミョウジが空だとNG' do
      @end_user.kana_family_name = ''
      expect(@end_user.valid?).to eq(false)
    end
    it 'ナマエが空だとNG' do
      @end_user.kana_first_name = ''
      expect(@end_user.valid?).to eq(false)
    end
    it '郵便番号が空だとNG' do
      @end_user.kana_family_name = ''
      expect(@end_user.valid?).to eq(false)
    end
    it '住所が空だとNG' do
      @end_user.kana_first_name = ''
      expect(@end_user.valid?).to eq(false)
    end
  end

  describe 'アソシエーションのテスト' do
    context '他モデルとの関係' do
      it 'Address 1:Nとなっている' do
        expect(EndUser.reflect_on_association(:addresses).macro).to eq :has_many
      end
      it 'Cards 1:Nとなっている' do
        expect(EndUser.reflect_on_association(:cards).macro).to eq :has_many
      end
      it 'Orders 1:Nとなっている' do
        expect(EndUser.reflect_on_association(:orders).macro).to eq :has_many
      end
    end
  end

end
