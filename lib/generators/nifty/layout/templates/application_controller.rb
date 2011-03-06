class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  protect_from_forgery

  helper_method :current_user

  def created(s); success(:created,s) end
  def deleted(s); success(:deleted,s) end
  def d(s); t(s).downcase end
  def success(act,mdl); t("success.#{act}",:obj=>d(mdl)) end
  def updated(s); success(:updated,s) end  

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
