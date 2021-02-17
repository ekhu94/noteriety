class WelcomeController < ApplicationController
    helper_method :current_user, :logged_in?, :date_today
    before_action :require_login

    def home
    end
end