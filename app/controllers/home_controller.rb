class HomeController < ApplicationController
  def index

  end

  def users
    @users = User.order(:user_name)
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users.csv" }
  def pdfs
    @employees = Employee.all

    respond_to do |format|
      format.html
      format.pdf do
        pdf = EmployeePdf.new(@employees)
        send_data pdf.render, filename: 'employee.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end
end
