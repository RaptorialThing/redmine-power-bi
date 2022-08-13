class ReportsController < ApplicationController
  before_action :authorize_powerbi

  def index
    @reports = Report.all
    @user_reports = UserReport.all
  end

  def show
    @report = Report.find(params[:id])
    get_power_bi_report
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)

    if @report.save 
      redirect_to @report 
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])

    if @report.update(report_params)
      redirect_to @report 
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    redirect_to reports_path, status: :see_other
  end

  private 
    def report_params 
      params.require(:report).permit(:power_bi_id, :power_bi_name, :embed_url)
    end

    def get_power_bi_report
      client = OAuth2::Client.new(Report.power_bi_config["CLIENT_ID"], Report.power_bi_config["CLIENT_SECRET"], site: 'https://login.microsoftonline.com', token_url: "#{Report.power_bi_config['TENANT']}/oauth2/token")

      token = nil

      def get_token(client, token)
        if token.nil? || token.expired?
          token = client.password.get_token(Report.power_bi_config["USERNAME"], Report.power_bi_config["PASSWORD"], scope: 'openid', resource: 'https://analysis.windows.net/powerbi/api')
        end
        token
      end

      pbi = PowerBI::Tenant.new(->{token = get_token(client, token) ; token.token})
      workspaces = pbi.workspaces

      ws = workspaces[0]
      @refresh_token = token.token
  
      rp = ws.reports.first

      @name =  rp.name
      @embedURL = rp.embed_url
      @report_id = rp.id
    end

    def authorize_powerbi
        raise Unauthorized unless User.current.allowed_to?(:all_power_bi_reports, nil, :global => true)
    end
end
