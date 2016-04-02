class UsersController < ApplicationController
    #GET index
    def index
        @users = User.all
    end

    #GET show
    def show
        id = params[:id]
        @user = User.find_by(id: id)

        if not @user
            flash[:warning] = "Unable to find user"
            redirect_to '/' 
        end

        if @user
            clinic_id = @user.clinics_id
            @clinic = Clinic.find_by(clinic_id)
        end
    end
end
