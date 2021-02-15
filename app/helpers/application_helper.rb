module ApplicationHelper
    def current_user
        User.find_by(id: session[:user_id])
    end

    def current_username
        current_user.username
    end

    def logged_in?
        !!current_user
    end

    def require_login
        redirect_to '/login' unless logged_in?
    end
end
