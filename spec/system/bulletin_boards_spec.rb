# frozen_string_literal: true

require 'rails_helper'

describe 'bulletin_boardのテスト' do
  let(:end_user) { create(:end_user) }
  let(:bulletin_board) { create(:bulletin_board) }
  before do
    visit bulletin_boards_path
  end
  describe 'indexのテスト' do
    context '掲示板一覧の確認' do
      it '配送先と表示される' do
        expect(page).to have_content '掲示板一覧'
      end
      it 'タイトルフォームが表示される' do
        expect(page).to have_field 'bulletin_board[title]'
      end
      it '投稿者名フォームが表示される' do
        expect(page).to have_field 'bulletin_board[name]'
      end
      it '内容フォームが表示される' do
        expect(page).to have_field 'bulletin_board[body]'
      end
      it 'Create bulletin_boardボタンが表示される' do
        expect(page).to have_button '新規作成'
      end
      it '投稿に成功する' do
        fill_in 'bulletin_board[title]', with: Faker::Number.number(digits: 7)
        fill_in 'bulletin_board[name]', with: Faker::Lorem.characters(number: 20)
        fill_in 'bulletin_board[body]', with: Faker::Lorem.characters(number: 20)
        click_button '新規作成'
        expect(page).to have_content '新しく投稿されました'
      end
      it '投稿に失敗する' do
        click_button '新規作成'
        expect(page).to have_content '空白があります'
      end
    end
  end

  describe '個別ページのテスト' do
    context '詳細への遷移' do
      it '遷移できる' do
        visit bulletin_board_path(bulletin_board)
        expect(current_path).to eq('/bulletin_boards/' + bulletin_board.id.to_s)
      end
    end
    context '詳細の確認' do
      before do
        visit bulletin_board_path(bulletin_board)
      end
      it 'titleが表示される' do
        expect(page).to have_content  bulletin_board.title
      end
      it 'nameが表示される' do
        expect(page).to have_content  bulletin_board.name
      end
      it 'bodyが表示される' do
        expect(page).to have_content  bulletin_board.body
      end
      it 'comment投稿者名フォームが表示される' do
        expect(page).to have_field 'bulletin_board_comment[name]'
      end
      it 'comment内容フォームが表示される' do
        expect(page).to have_field 'bulletin_board_comment[comment]'
      end
      it 'Create bulletin_boardボタンが表示される' do
        expect(page).to have_button '投稿する'
      end
      it '投稿に成功する' do
        fill_in 'bulletin_board_comment[name]', with: Faker::Lorem.characters(number: 20)
        fill_in 'bulletin_board_comment[comment]', with: Faker::Lorem.characters(number: 20)
        click_button '投稿する'
        expect(page).to have_content '新しく投稿されました'
      end
      it '投稿に失敗する' do
        click_button '投稿する'
        expect(page).to have_content 'コメントを入力してください'
      end
    end
  end
end
