class NotesController < ApplicationController
    helper_method :current_user, :logged_in?, :subject_destroy
    before_action :require_login
    before_action :set_note, only: [:show, :edit, :update, :destroy]

    def index
        @notes = Note.where(user: current_user).sort { |a, b| b.created_at <=> a.created_at }
    end

    def show
    end

    def new
        @note = Note.new
        3.times { @note.bullet_points.build }
    end

    def create
        @note = Note.new(note_params)
        @note.user = current_user
        if @note.save
            current_user.notes << @note
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        3.times { @note.bullet_points.build if @note.bullet_points.length < 3 }
    end

    def update
        if @note.update(note_params)
            redirect_to note_path(@note)
        else
            render :edit
        end
    end

    def destroy
        @note.destroy
        subject_destroy(@note.subject)
        flash.now[:destroy_success] = "You have successfully deleted this note."
        redirect_to root_path
    end

    private

    def destroy_bullet_point(bullet_point)
        bullet_point.destroy
        redirect_to note_path(@note)
    end

    def set_note
        @note = Note.find(params[:id])
    end

    def note_params
        params.require(:note).permit(:topic, :content, :subject_name, :summary_note, bullet_points_attributes: [:keywords])
    end
end