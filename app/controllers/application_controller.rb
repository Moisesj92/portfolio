class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :logged_in?, :admin_user?

  private

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def admin_user?
    logged_in? && current_user.admin?
  end

  def require_admin
    return if admin_user?

    store_location
    redirect_to login_path, alert: "Please sign in with an admin account."
  end

  def store_location
    session[:return_to] = request.fullpath if request.get?
  end

  def redirect_back_or_default(default_path)
    redirect_to(session.delete(:return_to) || default_path)
  end
end
