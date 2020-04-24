class HomeController < ApplicationController
  def index

  end

  def users
    @users = User.order(:user_name)
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users.csv" }
    end
  end
end
