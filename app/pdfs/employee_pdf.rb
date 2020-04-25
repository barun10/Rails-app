class EmployeePdf < Prawn::Document
    def initialize(employees)
      super()
      @employees = Employee.order(:name)
      employee_name
    end

    def employee_name
      table employee_name_all do
        row(0).font_style = :bold
        self.header = true
      end
    end

    def employee_name_all
      [["name", "email", "phone number"]] + 
      @employees.map do |employee|
        [employee.name, employee.email, employee.phone_number]
      end
    end
end