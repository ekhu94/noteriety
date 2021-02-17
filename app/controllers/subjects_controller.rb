class SubjectsController < ApplicationController
    helper_method :current_user, :logged_in?
    before_action :require_login
    before_action :set_subject, only: [:show]

    validates :name, presence: true

    def index
        @subjects = Subject.all
    end

    def show
    end

    private

    def set_subject
        @subject = Subject.find(params[:id])
    end

    def subject_params
        params.require(:subject).permit(:name)
    end
end