Redmine::Plugin.register :power_bi do
  name 'Power Bi plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url ''
  author_url 'https://t.me/raptorialthing'

  project_module :power_bi do 
    permission :all_power_bi_reports, :power_bi => :index
    permission :show_power_bi_reports, :power_bi => :show
    permission :new_power_bi_reports, :power_bi => :new
    permission :edit_power_bi_reports, :power_bi => :edit
    permission :delete_power_bi_reports, :power_bi => :destroy
  end
  
  menu :application_menu, :reports, { :controller => 'reports', :action => 'index' }, caption: 'Report'
  settings default: {'empty' => true}, partial: 'settings/powerbi_settings'
end
