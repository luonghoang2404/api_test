class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def managers
    if params[:order] == 'employees'
      @managers = Employee.find_by_sql("SELECT a.first_name || ' ' || a.last_name AS boss, 
                                              COUNT(b.first_name || ' ' || b.last_name) AS number_of_employees 
                                        FROM employees a 
                                        JOIN employees b 
                                        ON a.id = b.manager_id
                                        GROUP BY boss
                                        ORDER BY number_of_employees DESC")

        
    else
      @managers = Employee.select("first_name || ' ' ||last_name AS full_name").where(id: Employee.pluck(:manager_id).uniq.compact)
    end
    render json: @managers
  end




  def young_managers
    @managers = Employee.select("first_name || ' ' ||last_name AS full_name, age").where(id: Employee.pluck(:manager_id).uniq.compact).order(:age).limit(3)
    render json: @managers
  end



 


















































































  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
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
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_ids
    end

    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.fetch(:employee, {})
    end
end
