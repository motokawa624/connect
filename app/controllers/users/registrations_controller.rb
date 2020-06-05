class Users::RegistrationsController < Devise::RegistrationsController
    # git hubログイン用の記述
  def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end

end
