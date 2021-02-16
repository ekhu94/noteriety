class BulletPointsController < ApplicationController
    before_action :set_bullet_point, only: [:edit, :update, :destroy]

    def destroy
        @note = @bullet_point.note
        @bullet_point.destroy
        redirect_to note_path(@note)
    end

    private

    def set_bullet_point
        @bullet_point = BulletPoint.find(params[:id])
    end

    def bullet_point_params
        params.require(:bullet_point).permit(:keywords, :note_id)
    end
end