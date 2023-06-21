class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required

   
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
        if current_user == nil
           flash[:notice] = "ログインもしくはサインアップが必要です"
           redirect_to login_path 
        end
    end

    def no_authority_after_login
        if current_user != nil
            flash[:error] = "現在ログインしています"
            redirect_to tasks_path
        end
    end
end
