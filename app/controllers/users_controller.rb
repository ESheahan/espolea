class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
      puts "Inside the show user path"
      @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    #byebug
    is_valid = check_params(-1)

    if is_valid == "None"
        @user = User.new(user_params)
    else
        flash[:warning] = "Bad submission"
        redirect_to register_path
        return
    end

    if @user.save
        params[:id] = @user.id
        redirect_to "/users/#{@user.id}" and return
    else
        flash[:warning] = "Bad Submission"
        redirect_to login_path and return
    end
    #respond_to do |format|
      #if @user.save
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
      #else
        #format.html { render :new }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    is_valid = check_params(@user.id)
    puts is_valid

    if not is_valid == "None"
        puts "Not valid --> redirecting"
        flash[:warning] = is_valid
        redirect_to edit_user_path(@user) and return
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def login
      @user = User.where(email: params[:email]).take
  end

  def signin
      flash[:warning] = nil
      #puts "Email Address: #{params[:user][:email]}" 
      user_record = User.where(email: params[:user][:email]) 

      #Check to see if no user matches
      if user_record.length == 0
          puts "Warning: No user found with that email"
          flash[:warning] = "No user found with that email"
          redirect_to "/login"
          return
      end

      @user = user_record.take

      puts "User: #{@user}"
      puts "Email: #{@user.email}"
      puts "Password: #{params[:user][:password]}"

      if @user.password == params[:user][:password]
          #User successfully logged in
          add_user_to_session(@user)   
          puts "Redirecting to show user profile"
          redirect_to user_path(:id => @user.id) 
          return
          #puts "Redirecting to: /users/#{@user.id}"
          #redirect_to("/users/#{@user.id}") 
      else
          puts "Incorrect password. Redirecting to login path"
          flash[:warning] = "Incorrect Password" 
          redirect_to login_path 
          return
      end
  end

  def register
      @user = User.new

  end

  def confirm_registration
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      puts "Inside set user"
      if params[:id]
        @user = User.find(params[:id])
      else
          flash[:message] = "Please login to continue"
          redirect_to login_path
      end
    end

    def add_user_to_session(the_user)
        #the_user = User.find(id).take
        puts "User: #{the_user}"

        admin_list = ["admin@gmail.com"]

        if the_user != nil
            session[:user_id] = the_user.id 

            if admin_list.include? the_user.email
                session[:is_admin] = status
            else
                session[:is_admin] = false
            end
        else
            flash[:message] = "Unable to add user to the session"
            redirect_to login_path
        end
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

            if error_list.include? 1
                error_message += "First name field required; "
            end

            if error_list.include? 2
                error_message += "Last name field required; "
            end

            if error_list.include? 3
                error_message += "Email field required; "
            end
            
            if error_list.include? 4
                error_message += "Password field required; " 
            end
        end
        
        return error_message
    end
    
    def create_error_list
        error_list = [0]
        if params[:user][:first_name] == ""
            if @prev_user
                params[:user][:first_name] = @prev_user.first_name
            end
            error_list.push(1)
        end

        if params[:user][:last_name] == ""
            if @prev_user
                params[:user][:last_name] = @prev_user.last_name
            end
            error_list.push(2)
        end

        if params[:user][:email] == ""
            if @prev_user
                params[:user][:email] = @prev_user.email
            end
            error_list.push(3)
        end

        if params[:user][:password] == ""
            if @prev_user
                params[:user][:password] = @prev_user.password
            end
            error_list.push(4)
        end
        return error_list
    end
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :admin)
    end
end
