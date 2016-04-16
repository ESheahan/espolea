class UsersController < ApplicationController
    #GET index
    def index
        @users = User.all
    end

    def check_params(id)
        if id == -1
            @prev_user = nil
        else
            @prev_user = User.find_by_id(id)
        end

        error_list = create_error_list
        error_message = create_error_message(error_list)
        return error_message
    end
    
    def create_error_message(error_list)
        if error_list.sum == 0
            error_message = "None"
        else
            error_message = "Error: "
            archive_error = ["First name field required; ", "Last name field required; ", 
                "Email field required; ", "Password field required; "]
            counter = 1
            error_list.each do |error| 
                error_message += archive_error[(error-1)]
            end
        end
        return error_message
    end
    
    def create_error_list
        error_list = [0]
        param_list = ["first_name", "last_name", "email", "password"]
        
        counter = 1
        param_list.each do |field| 
            error_val = field_check(field, counter)
            if error_val != -1
                error_list.push(error_val)
            end
            counter += 1
        end
        return error_list
    end
    
    def field_check(field, error_no)
        if params[:user][field] == ""
            if @prev_user
                params[:user][field] = @prev_user[field]
            end
            return error_no
        end
        return -1
    end
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :admin)
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
    
    def current_user
        @current_user ||= User.find_by(id: session[:id])
    end
end
