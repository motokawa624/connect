require 'rails_helper'

describe 'ユーザー認証にテスト' do
  describe 'ユーザー新規登録' do
    before do
      visit new_user_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'user[name]', with: Faker::Internet.username(specifier: 5)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button 'ユーザー登録'

        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      it '新規登録に失敗する' do
        fill_in 'user[name]', with: ''
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        click_button 'ユーザー登録'

        expect(page).to have_content 'n4 件のエラーが発生したため user は保存されませんでした'
      end
    end
  end
    describe 'ユーザーログイン' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_user) { user }
      it 'ログインに成功する' do
        fill_in 'user[email]', with: test_user.email
        fill_in 'user[password]', with: test_user.password
        click_button 'ログイン'
        expect(page).to have_content "ログインしました。"
      end

      it 'ログインに失敗する' do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button "ログアウト"

        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end

describe 'ユーザーのテスト' do
  let(:user) { create(:user) }
  let!(:test_user2) { create(:user) }
  let!(:team) { create(:team, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
  describe 'サイドバーのテスト' do
    context '表示の確認' do
      it '画像が表示される' do
        expect(page).to have_css('img.profile_image')
      end
      it '名前が表示される' do
        expect(page).to have_content(user.name)
      end
      it 'フォローリンクが表示される' do
        expect(page).to have_link '', href: user_follows_path(user)
      end
      it 'フォロワーリンクが表示される' do
        expect(page).to have_link '', href: user_followers_path(user)
      end
      it 'マイページリンクが表示される' do
        visit user_path(user)
        expect(page).to have_link '', href: edit_user_path(user)
      end
      it 'マイチームリンクが表示される' do
        visit user_path(user)
        expect(page).to have_link '', href: home_path(user)
      end
    end
  end
end