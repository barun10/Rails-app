class UsersController < ApplicationController
    def index
        @users = User.order(:user_name)
        respond_to do |format|
            format.html
            format.csv { send_data @users.to_csv(['user_name','user_email','phone_number'])}
        end
    end
    def import
        User.import(params[:file])
    end
end
