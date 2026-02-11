class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].to_s.strip.downcase)

    if user&.authenticate(params[:password]) && user.admin?
      session[:user_id] = user.id
      redirect_back_or_default(admin_posts_path)
    else
      flash.now[:alert] = "Invalid credentials."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Signed out."
  end
end
