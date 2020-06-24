require 'rails_helper'

RSpec.describe 'Teamモデルのテスト', type: :model do
	describe 'バリデーションのテスト' do
		it "チームネームがない場合、チーム登録に失敗すること" do
			    team = Team.new(
			    	name: ""
		      )
		        team.name = ""
		        team.valid?
		        expect(team.errors.full_messages).to include "Nameを入力してください"
		 end
	 		it "チームについてがない場合、チーム登録に失敗すること" do
		    team = Team.new(
	           introduction: ""
	      )
	        team.introduction = ""
	        team.valid?
	        expect(team.errors.full_messages).to include "Introductionを入力してください"
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
  end
end