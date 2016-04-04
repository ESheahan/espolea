class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  # GET /clinics
  # GET /clinics.json
  def index
    #@clinics = Clinic.all
    @filterrific = initialize_filterrific(
    Clinic,
    params[:filterrific],
    select_options: {
        by_state: Clinic.options_for_select_state,
        by_municipality: Clinic.options_for_select_municipality
      },
      default_filter_params: {},
    ) or return
    @clinics = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
    rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
    
  end
  
  # GET /clinics/1
  # GET /clinics/1.json
  def show
  end

  # GET /clinics/new
  def new
    @clinic = Clinic.new
  end

  # GET /clinics/1/edit
  def edit
  end

  # POST /clinics
  # POST /clinics.json
  def create
    #byebug
    is_valid = check_params(-1)

    if is_valid == "None"
        @clinic = Clinic.new(clinic_params)
    else
        #Sets the flash[:warning] value to the rendered error message
        flash[:warning] = is_valid
        redirect_to new_clinic_path and return
    end

    respond_to do |format|
      if @clinic.save
        format.html { redirect_to @clinic, notice: 'Clinic was successfully created.' }
        format.json { render :show, status: :created, location: @clinic }
      else
        format.html { render :new }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinics/1
  # PATCH/PUT /clinics/1.json
  def update
    is_valid = check_params(@clinic.id)
    update =  @clinic.update(clinic_params)

    #byebug
    if (is_valid == "None") and update
        flash[:notice] = "Clinic was sucessfully updated"
    else
        #Sets the flash[:warning] value to the rendered error message
        flash[:warning] = is_valid
        redirect_to edit_clinic_path(@clinic) and return
    end

    respond_to do |format|
      is_valid = check_params(@clinic.id)
      update =  @clinic.update(clinic_params)
      if (is_valid == "None") and update 
        format.html { redirect_to @clinic, notice: 'Clinic was successfully updated.' }
        format.json { render :show, status: :ok, location: @clinic }
      else
        flash[:warning] = is_valid
        format.html { render :edit, notice: is_valid }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
      @clinic = Clinic.find_by_id(params[:id])
  end

  # DELETE /clinics/1
  # DELETE /clinics/1.json
  def destroy
    @clinic.destroy
    respond_to do |format|
      format.html { redirect_to clinics_url, notice: 'Clinic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    def check_params(id)
        #byebug
        error_list = [0]
        if id == -1
            @prev_clinic = nil
        else
            @prev_clinic = Clinic.find_by_id(id)
        end

        if params[:clinic][:name] == ""
            if @prev_clinic
                params[:clinic][:name] = @prev_clinic.name
            end
            error_list.push(1)
        end

        if params[:clinic][:phone_number] == ""
            if @prev_clinic
                params[:clinic][:phone_number] = @prev_clinic.phone_number
            end
            error_list.push(2)
        end 

        if params[:clinic][:email] == ""
            if @prev_clinic
                params[:clinic][:email] = @prev_clinic.email
            end
            error_list.push(3)
        end

        #if params[:clinic][:website] = ""
            #if @prev_clinic
                #params[:clinic][:website] = @prev_clinic.password
            #else
                #return false
            #end
        #end

        if error_list.sum == 0
            error_message = "None"
        else
            error_message = "Error: "
            if error_list.include? 1
                error_message += "Name field required for clinic; "
            end

            if error_list.include? 2
                error_message += "Phone Number field required for clinic; "
            end

            if error_list.include? 3
                error_message += "Email field required for clinic; "
            end
        end

        return error_message
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_params
      params.require(:clinic).permit(:name, :phone_number, :email, :website, :state, :municipality)
    end
end
