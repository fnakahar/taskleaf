class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  # 以下のコードの部分は「もし@current_userに既に値が入っていればそれを尊重し、なければ」id: session[:user_idを入れるという意味
  # だが、後置ifの部分については不明。。なくても良いかも

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login_required
    redirect_to login_path unless current_user
  end

end


