module ApplicationHelper
  def user_is_owner?
    user_signed_in? and current_user.id == @user.id
  end
end
