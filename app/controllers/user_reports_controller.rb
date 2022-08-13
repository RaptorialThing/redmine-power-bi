class UserReportsController < ApplicationController
  
    def index
      @user_reports = UserReport.all
    end

    def create
        @user_reports = UserReport.new(user_reports_params)
    
        if @user_reports.save 
            redirect_back(fallback_location:"/reports")
        else 
            redirect_back(fallback_location:"/reports")
        end
    end

    def destroy
        @user_reports = UserReport.find(params[:id])
        @user_reports.destroy
    
        redirect_back(fallback_location:"/reports")
    end

    private 
    def user_reports_params 
      params.require(:user_report).permit(:report_id,:user_id)
    end
  end
  