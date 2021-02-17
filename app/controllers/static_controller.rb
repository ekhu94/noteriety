class StaticController < ApplicationController
    helper_method :current_user, :logged_in?, :date_today
    layout :determine_layout

    def about
        
    end

    private

    def determine_layout
        logged_in? ? 'application' : 'login'
    end
end