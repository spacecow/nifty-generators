class ApplicationController < ActionController::Base
  protect_from_forgery

  def created(s); success(:created,s) end
end
