class StudentMailer < ApplicationMailer
    def send_student_mail
        @students = Student.order(:name)
        mail( to:'barunalt@gmail.com', from:'mailtester891@gmail.com', subject:'Student list')
    end
end
