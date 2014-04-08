class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  check_authorization unless: :static_page?

  helper_method :current_user
  helper_method :user_signed_in?

  private

  def static_page?
    self.class == HighVoltage::PagesController
  end

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  def user_signed_in?
    return true if current_user
  end

  def authenticate_user!
    unless current_user
      redirect_to root_url, alert: 'You need to sign in for access to this page.'
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    redirect_to root_path, alert: exception.message
  end
end
