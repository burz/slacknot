module ApplicationHelper
  def user_is_owner?
    user_signed_in? and current_user.id == @user.id
  end

  def time_hms(seconds)
    hours = (seconds / 3600).to_i
    minutes = (seconds / 60 - hours * 60).to_i
    seconds = (seconds - (minutes * 60 + hours * 3600)).to_i
    "#{hours}:#{minutes}:#{seconds}"
  end
end
