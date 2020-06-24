# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_up_path_for(_resource)
    teams_path
  end

  # sign in後のredirect先変更
  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_root_path
    else
      teams_path
    end
  end

  # sign out後のredirect先変更
  def after_sign_out_path_for(_resource)
    root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name place]) # 新規登録時(sign_up時)にnameとplaceいうキーのパラメーターを追加で許可する
  end
end

Refile.secret_key = '78830f4cccb9bd882b92ff96b98aa02e67eb6f76e610dad629b277c5dcfa3f09223de47806f93538f8be73aba29970d1a986478ce9b0cb3f0c3fdf93b0cfca1a'
