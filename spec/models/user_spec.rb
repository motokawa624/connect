# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false
      end
      it '2文字以上であること' do
        test_user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '20文字以下であること' do
        test_user.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end
    context 'emailカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.email = ''
        is_expected.to eq false
      end
    end
    context 'passwordカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.email = ''
        is_expected.to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'Belongモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:belongs).macro).to eq :has_many
      end
    end
    context 'UserRoomモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:user_rooms).macro).to eq :has_many
      end
    end
    context 'Chatモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:chats).macro).to eq :has_many
      end
    end
  end
end
# アソシエーションのテスト
