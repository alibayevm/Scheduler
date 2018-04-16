class ReservedslotsController < ApplicationController
  def show
  end

  def new
  end

  def create
  	emp_id = params[:emp_id]
    timeslot_id = params[:timeslot_id]
    day_of_week = params[:day_of_week]
    start_time = params[:start_time]
    reservedslot = Reservedslot.new
    reservedslot.employee_id = emp_id
    reservedslot.timeslot_id = timeslot_id
    reservedslot.start_time = start_time
    reservedslot.day_of_week = day_of_week
    timeslot = Timeslot.find(timeslot_id)
    if reservedslot.save
    	timeslot.reserved = true
    	timeslot.save
    end
    @employee = Employee.find(emp_id)
    redirect_to employee_path(@employee)
  end

  def destroy
  	reservedslot = Reservedslot.find(params[:id])
  	timeslot = Timeslot.find(reservedslot.timeslot_id)
  	if reservedslot.destroy
  		timeslot.reserved = false
  		timeslot.save
  	end
  	emp_id = params[:emp_id]
	@employee = Employee.find(emp_id)
	redirect_to employee_path(@employee)
  end
end
