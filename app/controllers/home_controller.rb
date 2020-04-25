class HomeController < ApplicationController
  def index

  end

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
