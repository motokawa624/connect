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
end
