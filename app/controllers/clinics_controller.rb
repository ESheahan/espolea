class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  # GET /clinics
  # GET /clinics.json
  def index
    @filterrific = initialize_filterrific(
    Clinic,
    params[:filterrific],
    select_options: {
        by_state: Clinic.options_for_select_state,
        by_municipality: Clinic.options_for_select_municipality
      },
    ) or return

    @clinics = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
    
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
    @clinic = Clinic.find(params[:id])
  end

  # POST /clinics
  # POST /clinics.json
  def create
    @clinic = Clinic.new(clinic_params)
    if @clinic.save
      redirect_to clinics_path
    else
      render :new
    end
  end

  # PATCH/PUT /clinics/1
  # PATCH/PUT /clinics/1.json
  def update

    update =  @clinic.update(clinic_params)
    
    if update 
      redirect_to @clinic
    else
      render :edit
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

 

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_params
      params.require(:clinic).permit(:name, :phone_number, :email, :website, :state, :municipality)
    end
end
