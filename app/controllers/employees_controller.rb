class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all

    respond_to do |format|
      format.html
      format.pdf do
        pdf = EmployeePdf.new(@employees)
        send_data pdf.render, filename: 'employee.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end

  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
    end
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :email, :phone_number)
    end
end


