# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # git hubログイン用の記述
  # 新規登録時に必ずuidが埋まるようにする。
  def build_resource(hash = {})
    hash[:uid] = User.create_unique_string
    super
  end
end
