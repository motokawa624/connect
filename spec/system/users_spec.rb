# frozen_string_literal: true

require 'rails_helper'

  describe 'ユーザー認証のテスト' do
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

          expect(page).to have_content 'エラーが発生したため user は保存されませんでした'
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
          expect(page).to have_content 'ログインしました。'
        end

        it 'ログインに失敗する' do
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: ''
          click_button 'ログイン'

          expect(current_path).to eq(new_user_session_path)
        end
      end
    end
  end


  describe 'ユーザーのテスト' do
    let(:user) { create(:user) }
    let!(:test_user2) { create(:user) }
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
            expect(page).to have_link '', href: home_path
          end
        end
      end


      describe '編集のテスト' do
        context '自分の編集画面への遷移' do
          it '遷移できる' do
            visit edit_user_path(user)
            expect(current_path).to eq('/users/' + user.id.to_s + '/edit')
          end
        end
        context '他人の編集画面への遷移' do
          it '遷移できない' do
            visit edit_user_path(test_user2)
            expect(current_path).to eq('/users/' + user.id.to_s)
          end
        end
        context '表示の確認' do
          before do
            visit edit_user_path(user)
          end
          it 'プロフィール編集と表示される' do
            expect(page).to have_content('プロフィール編集')
          end
          it '名前編集フォームに自分の名前が表示される' do
            expect(page).to have_field 'user[name]', with: user.name
          end
          it '画像編集フォームが表示される' do
            expect(page).to have_field 'user[profile_image]'
          end
          it '自己紹介編集フォームに自分の自己紹介が表示される' do
            expect(page).to have_field 'user[introduction]', with: user.introduction
          end
          it '編集に成功する' do
            click_button '変更を保存する'
            expect(current_path).to eq('/users/' + user.id.to_s)
          end
          it '編集に失敗する' do
            fill_in 'user[name]', with: ''
            click_button '変更を保存する'
            expect(current_path).to eq('/users/' + user.id.to_s)
          end
        end
      end

      describe '一覧画面のテスト' do
        before do
          visit users_path
        end
        context '表示の確認' do
          it 'メンバー 一覧と表示される' do
            expect(page).to have_content('メンバー 一覧')
          end
          it '自分と他の人の画像が表示される' do
            expect(all('img').size).to eq(4)
          end
          it '自分と他の人の名前が表示される' do
            expect(page).to have_content user.name
            expect(page).to have_content test_user2.name
          end
          it '自分と他の人のエリアが表示される' do
            expect(page).to have_content user.place
            expect(page).to have_content test_user2.place
          end
          it 'showページへのリンクが表示される' do
            expect(page).to have_link , href: user_path(user)
            expect(page).to have_link , href: user_path(test_user2)
          end
        end
      end

      describe '詳細画面のテスト' do
        before do
          visit user_path(user)
        end
        context '表示の確認' do
          it 'メンバー詳細と表示される' do
            expect(page).to have_content('メンバー詳細')
          end
          it 'ユーザーの画像のリンク先が正しい' do
            expect(page).to have_link '', href: user_path(user)
          end
          it 'ユーザーのgithubのリンク先が正しい' do
            expect(page).to have_link user.url
          end
        end
      end
  end

