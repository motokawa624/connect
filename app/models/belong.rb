# frozen_string_literal: true

class Belong < ApplicationRecord
  belongs_to :user
  belongs_to :team
end
