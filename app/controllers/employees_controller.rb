class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    user_id = current_user.id
    emp = Employee.find_by_sql("select *
                                from employees e
                                where e.user_id = #{user_id}")
    if emp.empty?
      redirect_to new_employee_path
    else
      @users = User.all
      @employees = Employee.all
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @jobs = Job.all
    emp_id = params[:id]
    @works_as = Position.find_by_sql("select p.id, j.title, j.pay_rate, j.schedule_type, p.job_id
                                      from positions p, jobs j
                                      where p.employee_id = #{emp_id} and p.job_id = j.id")
    @timeslots = Timeslot.find_by_sql("select j.title, s.start_time, s.day_of_week, s.id, s.job_id, s.reserved
                                       from timeslots s, jobs j
                                       where s.job_id = j.id")
    @reserved_slots = Reservedslot.find_by_sql("select j.title, r.start_time, r.day_of_week, r.id
                                                from reservedslots r, jobs j, timeslots s
                                                where r.employee_id = #{emp_id} and r.timeslot_id = s.id and s.job_id = j.id")
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    @employee.user_id = current_user.id

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    emp_id = @employee.id
    emp_positions = Position.find_by_sql("select *
                                     from positions p
                                     where p.employee_id = #{emp_id}")
    emp_positions.each do |position|
      position.destroy
    end
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :phone_number, :user_id)
    end
end
