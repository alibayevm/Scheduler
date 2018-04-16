class TimeslotsController < ApplicationController
  def show
  end

  def new
  end

  def create
    @job = Job.find(params[:job_id])
    @timeslot = @job.timeslots.create(timeslot_params)
    @timeslot.reserved = false
    @timeslot.save
    redirect_to job_path(@job)
  end

  def destroy
  	timeslot = Timeslot.find(params[:id])
	  timeslot.destroy
	  @job = params[:job]
	  redirect_to job_path(@job)
  end

  private
		def timeslot_params
			params.require(:timeslot).permit(:start_time, :day_of_week)
		end
end
