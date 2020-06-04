class Team < ApplicationRecord
	has_many :favorites
	has_many :post_comments
	has_many :belongs

end
