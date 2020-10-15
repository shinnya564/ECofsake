require 'rails_helper'

describe 'ユーザー認証のテスト' do
  describe 'ユーザー新規登録' do
    before do
      visit new_end_user_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'end_user[family_name]', with: Faker::Internet.username(specifier: 5)
        fill_in 'end_user[first_name]', with: Faker::Internet.username(specifier: 5)
        fill_in 'end_user[kana_family_name]', with: 'テスト'
        fill_in 'end_user[kana_first_name]', with: 'テスター'
        fill_in 'end_user[postal_code]', with: Faker::Number.number(digits: 7)
        fill_in 'end_user[address]', with: Faker::Address.full_address
        fill_in 'end_user[tel]', with: Faker::Number.number(digits: 11)
        fill_in 'end_user[email]', with: Faker::Internet.email
        fill_in 'end_user[password]', with: 'password'
        fill_in 'end_user[password_confirmation]', with: 'password'
        click_button "新規登録"

        expect(page).to have_content 'Welcome!'
      end
      it '新規登録に失敗する' do
        fill_in 'end_user[family_name]', with: ''
        fill_in 'end_user[first_name]', with: ''
        fill_in 'end_user[kana_family_name]', with: ''
        fill_in 'end_user[kana_first_name]', with: ''
        fill_in 'end_user[email]', with: ''
        fill_in 'end_user[postal_code]', with: ''
        fill_in 'end_user[address]', with: ''
        fill_in 'end_user[tel]', with: ''
        fill_in 'end_user[password]', with: ''
        fill_in 'end_user[password_confirmation]', with: ''
        click_button "新規登録"

        expect(page).to have_content 'error'
      end
    end
  end
  describe 'ユーザーログイン' do
    let(:end_user) { create(:end_user) }
    before do
      visit new_end_user_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_end_user) { end_user }
      it 'ログインに成功する' do
        fill_in 'end_user[email]', with: test_end_user.email
        fill_in 'end_user[password]', with: test_end_user.password
        click_button 'ログイン'

        expect(page).to have_content 'ログインしました'
      end

      it 'ログインに失敗する' do
        fill_in 'end_user[email]', with: ''
        fill_in 'end_user[password]', with: ''
        click_button 'ログイン'

        expect(current_path).to eq(new_end_user_session_path)
      end
    end
  end
end

describe 'ユーザーのテスト' do
  let(:end_user) { create(:end_user) }
  let!(:test_end_user2) { create(:end_user) }
  let!(:address) { create(:address, end_user: end_user) }
  before do
    visit new_end_user_session_path
    fill_in 'end_user[email]', with: end_user.email
    fill_in 'end_user[password]', with: end_user.password
    click_button 'ログイン'
  end

  describe '編集のテスト' do
    context '自分の編集画面への遷移' do
      it '遷移できる' do
        visit edit_end_user_path(end_user)
        expect(current_path).to eq('/end_users/' + end_user.id.to_s + '/edit')
      end
    end
    context '他人の編集画面への遷移' do
      it '遷移できない' do
        visit edit_end_user_path(test_end_user2)
        expect(current_path).to eq('/end_users/' + end_user.id.to_s)
      end
    end

    context '表示の確認' do
      before do
        visit edit_end_user_path(end_user)
      end
      it '名前編集フォームに自分の名前が表示される' do
        expect(page).to have_field 'end_user[first_name]', with: end_user.first_name
      end
      it '編集に成功する' do
        click_button '保存する'
        expect(page).to have_content '更新しました'
        expect(current_path).to eq('/end_users/' + end_user.id.to_s)
      end
      it '編集に失敗する' do
        fill_in 'end_user[family_name]', with: ''
        fill_in 'end_user[first_name]', with: ''
        fill_in 'end_user[kana_family_name]', with: ''
        fill_in 'end_user[kana_first_name]', with: ''
        fill_in 'end_user[email]', with: ''
        fill_in 'end_user[postal_code]', with: ''
        fill_in 'end_user[address]', with: ''
        fill_in 'end_user[tel]', with: ''
        click_button '保存する'
        expect(page).to have_content '更新に失敗しました.'
				#もう少し詳細にエラー文出したい
        expect(current_path).to eq('/end_users/' + end_user.id.to_s + '/edit')
      end
    end
  end

  describe '詳細画面のテスト' do
    before do
      visit end_user_path(end_user)
    end
    context '表示の確認' do
      it '登録者情報と表示される' do
        expect(page).to have_content('登録者情報')
      end
    end
  end
end
