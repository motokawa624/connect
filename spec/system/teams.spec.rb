# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'チーム機能', type: :system do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:team) { create(:team, user: user) }
  let!(:team2) { create(:team, user: user2) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
    visite teams_path
  end
  describe 'チーム一覧画面のテスト' do
    context '表示の確認' do
      it 'チーム一覧と表示される' do
        expect(page).to have_content 'チーム一覧'
      end
      it 'チームの名前が表示される' do
        expect(page).to have_content 'team[name]'
        expect(page).to have_content 'team2[name]'
      end
      it 'チームのオーナー名が表示される' do
        expect(page).to have_content 'team[owner_user.name]'
        expect(page).to have_content 'team2[owner_user.name]'
      end
      it 'チームのエリアが表示される' do
        expect(page).to have_content 'team[place]'
        expect(page).to have_content 'team2[place]'
      end
      it 'opinionフォームが表示される' do
        expect(page).to have_field 'book[body]'
      end
      it 'Create Bookボタンが表示される' do
        expect(page).to have_button 'Create Book'
      end
      it '投稿に成功する' do
        fill_in 'book[title]', with: Faker::Lorem.characters(number: 5)
        fill_in 'book[body]', with: Faker::Lorem.characters(number: 20)
        click_button 'Create Book'
        expect(page).to have_content 'successfully'
      end
      it '投稿に失敗する' do
        click_button 'Create Book'
        expect(page).to have_content 'error'
        expect(current_path).to eq('/books')
      end
    end
  end
end
