class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :default_currency

  private

  def default_currency

  	session[:default_currency] ||= "$"
  	session[:default_currency] = params[:currency].html_safe if params[:currency].present?

  	session[:default_currency]
  	
  end
end
