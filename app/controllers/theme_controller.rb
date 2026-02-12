class ThemeController < ApplicationController
  def toggle
    current_theme = session[:theme] || "light"
    session[:theme] = current_theme == "light" ? "dark" : "light"
    redirect_back fallback_location: root_path
  end
end
