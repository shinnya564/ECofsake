class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	#デバイス機能実行前にconfigure_permitted_parametersの実行をする。
	protect_from_forgery with: :exception

	protected

	def after_sign_in_path_for(resource)
	    case resource
	    when Admin
			admins_end_users_path
	    when EndUser
	    	products_path
	    end
	end

	#sign_out後のredirect先変更する。何も設定しなければrootパスへ。
	def after_sign_out_path_for(resource)
	    case resource
	    when Admin
			new_admin_sessio_path
	    when EndUser
	    	products_path
	    end
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :kana_family_name, :kana_first_name, :postal_code, :address, :email, :tel ])
		#sign_upの際にnameのデータ操作を許。追加したカラム。
	end

end
