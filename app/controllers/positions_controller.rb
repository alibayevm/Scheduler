class PositionsController < ApplicationController
  def show
  end

  def new

  end

  def create
  	emp_id = params[:emp_id]
	j_id = params[:j_id]
	@position = Position.new
	@position.employee_id = emp_id
	@position.job_id = j_id
	@position.save
	@employee = Employee.find(emp_id)
	redirect_to employee_path(@employee)
  end

  def destroy
  	position = Position.find(params[:id])
  	position.destroy
	  @employee = params[:emp]
	  redirect_to employee_path(@employee)
  end
end
