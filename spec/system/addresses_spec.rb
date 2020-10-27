# frozen_string_literal: true

require 'rails_helper'

describe 'Addressのテスト' do
  let(:end_user) { create(:end_user) }
  let!(:end_user2) { create(:end_user) }
  let!(:address) { create(:address, end_user: end_user) }
  let!(:address2) { create(:address, end_user: end_user2) }
  before do
    visit new_end_user_session_path
    fill_in 'end_user[email]', with: end_user.email
    fill_in 'end_user[password]', with: end_user.password
    click_button 'ログイン'
    visit end_user_addresses_path(address)
  end
  describe 'indexのテスト' do
    context '表示の確認' do
      it '配送先と表示される' do
        expect(page).to have_content '配送先登録/一覧'
      end
      it '郵便番号フォームが表示される' do
        expect(page).to have_field 'address[postal_code]'
      end
      it '住所フォームが表示される' do
        expect(page).to have_field 'address[address]'
      end
      it '届先名フォームが表示される' do
        expect(page).to have_field 'address[name]'
      end
      it 'Create addressボタンが表示される' do
        expect(page).to have_button '新しい住所を登録する'
      end
      it '投稿に成功する' do
        fill_in 'address[postal_code]', with: Faker::Number.number(digits: 7)
        fill_in 'address[address]', with: Faker::Lorem.characters(number: 20)
        fill_in 'address[name]', with: Faker::Lorem.characters(number: 20)
        click_button '新しい住所を登録する'
        expect(page).to have_content '配送先を追加しました'
      end
      it '投稿に失敗する' do
        click_button '新しい住所を登録する'
        expect(page).to have_content '空白があります'
      end
      it '投稿の削除リンクが表示される' do
        expect(page).to have_link '削除', href: end_user_address_path(end_user, address)
      end
    end
  end

  describe '編集のテスト' do
    context '自分の編集画面への遷移' do
      it '遷移できる' do
        visit edit_end_user_address_path(end_user, address)
        expect(current_path).to eq('/end_users/' + end_user.id.to_s + '/addresses/' + address.id.to_s + '/edit')
      end
    end
    context '他人の投稿の編集画面への遷移' do
      it '遷移できない' do
        visit edit_end_user_address_path(end_user2, address2)
        expect(current_path).to eq('/end_users/' + end_user.id.to_s + '/addresses')
      end
    end
    context '表示の確認' do
      before do
        visit edit_end_user_address_path(end_user, address)
      end
      it '配送先編集と表示される' do
        expect(page).to have_content('配送先編集')
      end
      it '郵便番号編集フォームが表示される' do
        expect(page).to have_field 'address[postal_code]', with: address.postal_code
      end
      it '住所編集フォームが表示される' do
        expect(page).to have_field 'address[address]', with: address.address
      end
      it '配送先名編集フォームが表示される' do
        expect(page).to have_field 'address[name]', with: address.name
      end
      it '配送先一覧リンクが表示される' do
        expect(page).to have_link '配送先一覧', href: end_user_addresses_path(end_user)
      end
    end
  end
end
