class Report < ActiveRecord::Base
    has_many :user_report

    def self.power_bi_config

    YAML.load_file("powerbi.yml")

    end
end
