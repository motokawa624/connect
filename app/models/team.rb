class Team < ApplicationRecord
	has_many :favorites
	has_many :post_comments
	has_many :belongs
	has_many :users
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

	# rifile
	attachment :team_image
	# タグ付
	acts_as_taggable
end
