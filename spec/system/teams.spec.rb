# frozen_string_literal: true

require 'rails_helper'

  describe 'チーム機能', type: :system do
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
          end
        end
  end
