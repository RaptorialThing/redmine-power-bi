class Report < ActiveRecord::Base
    has_many :user_report, :dependent => :destroy

    def self.power_bi_config

    YAML.load_file(File.join(Rails.root,  'plugins/power_bi/config', "powerbi.yml"))
    
    end
end
