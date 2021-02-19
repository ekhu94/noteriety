class NotesController < ApplicationController
    helper_method :current_user, :logged_in?, :subject_destroy
    before_action :require_login
    before_action :set_note, only: [:show, :edit, :update, :destroy]

    def index
        @notes = current_user.notes.search(params[:query])
        render :index
    end

    def show
    end

    def new
        @note = Note.new
        @note.bullet_points.destroy_all
        3.times { @note.bullet_points.build }
    end

    def create
        @note = Note.new(note_params)
        @note.user = current_user
        if @note.save
            # current_user.notes << @note
            flash[:new_success] = "Your new note has successfully been saved!"
            redirect_to note_path(@note)
        else
            @note.bullet_points.destroy_all
            3.times { @note.bullet_points.build }
            render :new
        end
    end

    def edit
        3.times { @note.bullet_points.build if @note.bullet_points.length < 3 }
    end

    def update
        if @note.update(note_params)
            flash[:update_success] = "You have successfully updated this note."
            redirect_to note_path(@note)
        else
            render :edit
        end
    end

    def destroy
        @note.destroy
        subject_destroy(@note.subject)
        flash[:destroy_success] = "You have successfully deleted this note."
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