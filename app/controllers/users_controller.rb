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
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
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
      @user = User.where(email: params[:email]).take

      #Check whether user exists first
      if @user.blank?
          flash[:message] = "No user found with that email"
          redirect_to login_path
      end

      if @user.password == params[:password]
          #User successfully logged in
          add_user_to_session(@user.id)   
          redirect_to user_path
      else
          flash[:message] = "Incorrect Password" 
          redirect_to login_path
      end
  end

  def register
  end

  def confirm_registration
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if not params[:id]
        @user = User.find(params[:id])
      else
          flash[:message] = "Please login to continue"
          redirect_to login_path
      end
    end

    def add_user_to_session(id)
        the_user = User.find(id).take

        if the_user != nil
            session[:user_id] = the_user.id 
        else
            flash[:message] = "Unable to add user to the session"
            redirect_to login_path
        end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :admin)
    end
end
