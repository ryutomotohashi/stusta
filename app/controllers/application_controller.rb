class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後遷移画面
  def after_sign_in_path(resource)
    user_path(current_user.id)
  end

  #サインアウト後遷移画面
  def after_sign_out_path(resource)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end
end
