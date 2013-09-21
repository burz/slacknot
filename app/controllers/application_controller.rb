class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    user_klasses_path(resource)
  end

  def ensure_owner
    if not user_signed_in?
      redirect_to new_user_session_path, notice: 'You must log in to access this page'
    elsif current_user.id != @user.id
      raise ActionController::RoutingError.new('Unauthorized')
    end
  end
end
