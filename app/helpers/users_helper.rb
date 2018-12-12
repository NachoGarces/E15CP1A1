module UsersHelper
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged?
    session[:user_id].present? ? true : false
  end

  def reset_session
    session.delete(:user_id)
  end
end
