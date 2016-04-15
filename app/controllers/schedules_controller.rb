class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index

    if current_user != nil
        @schedules = Schedule.all
    else
        redirect_to new_user_session_path
    end
  end

  #POST /find
  def find

    # TODO: Figure out using datetime module 
      
    filtered_appointments = Schedule.all

    interim_appointments = []
    the_reason = params[:reason]
    if the_reason != nil and the_reason.strip != ""
        filtered_appointments.each do |appointment|
            if appointment.treatment_options.include? the_reason        
                interim_appointments.push(appointment)
            end
        end
    end


    @appointments = []
    interim_appointments.each do |appointment|
        clinic = Clinic.find_by(id: appointment.the_clinic)

        if clinic != nil
            @appointments.push(appointment)
        end
    end 

  end 
 

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end


  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    if params[:schedule]["start_time(1i)"] > params[:schedule]["end_time(1i)"]
        redirect_to "/find"
        return
    end

    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:start_time, :end_time, :treatment_options)
    end
end
