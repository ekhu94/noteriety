class NotesController < ApplicationController
    helper_method :current_user, :logged_in?
    before_action :require_login
    before_action :set_note, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @note = Note.new
        3.times { @note.bullet_points.build }
        @note.summaries.build
    end

    def create
        @note = Note.new(note_params)
        if @note.save
            session[:user_id].notes << @note
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @note.update
            redirect_to root_path
        else
            render :edit
        end
    end

    private

    def set_note
        @note = Note.find(params[:id])
    end

    def note_params
        params.require(:note).permit(:topic, :content, :subject_name, :summary, bullet_point_contents: [])
    end
end