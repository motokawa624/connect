class ApplicationController < ActionController::Base
	def after_sign_up_path_for(resource)
    home_path
  end
	  #sign in後のredirect先変更
  def after_sign_in_path_for(resource)
    home_path
  end

   #sign out後のredirect先変更
  def after_sign_out_path_for(resource)
    root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :place]) # 新規登録時(sign_up時)にnameとplaceいうキーのパラメーターを追加で許可する
  end
end
