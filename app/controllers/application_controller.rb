class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required

  private

  def login_required
    redirect_to new_session_path unless logged_in?
  end

  def current_login?
    redirect_to tasks_path if logged_in?
  end
end
