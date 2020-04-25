class HomeController < ApplicationController
  def index

  end

  def send_mail
    StudentMailer.send_student_mail.deliver_now
    render :html => "mail sent"
  end
end
