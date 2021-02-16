class SummariesController < ApplicationController
    helper_method :current_user, :logged_in?
    before_action :require_login

    def index
    end
end