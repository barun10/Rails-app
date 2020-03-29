class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]
    def index
      @students = Student.order(:name)
    end
  
    def show
    end
  
    def new
      @student = Student.new
    end
  
    def edit
    end

    def create
      @student = Student.new(student_params)
  
      respond_to do |format|
        if @student.save
          format.html { redirect_to @student, notice: 'Student was successfully created.' }
          format.json { render :show, status: :created, location: @student }
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to @student, notice: 'Student was successfully updated.' }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { render :edit }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @student.destroy
      respond_to do |format|
        format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def send_mail
      StudentMailer.send_student_mail.deliver_now
      render :html => "mail sent"
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_student
        @student = Student.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def student_params
        params.require(:student).permit(:name, :email, :phone_number)
      end
  end
  