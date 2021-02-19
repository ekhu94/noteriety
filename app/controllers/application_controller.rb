class ApplicationController < ActionController::Base

    def date_today
        DateTime.now.strftime('%B %e, %Y')
    end

    def greeting(name)
        time = DateTime.now.hour
        if time >= 0 && time < 12
            "Good morning, #{name}"
        elsif time >= 12 && time < 18
            "Good afternoon, #{name}"
        else
            "Good evening, #{name}"
        end
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def require_login
        redirect_to '/login' unless logged_in?
    end

    def subject_destroy(subject)
        subject.destroy if subject.notes.length == 0
    end

end
