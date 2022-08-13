class Report < ActiveRecord::Base
    has_many :user_report

    def self.power_bi_config

    {
        "AUTHORITY_HOST" => 'login.microsoftonline.com',
        "TENANT" => "", #directory id of workspace in power bi
        "CLIENT_ID" => '', 
        "CLIENT_SECRET" => '', #client secret value, not id
        "RESOURCE" => 'https://analysis.windows.net/powerbi/api',
        "USERNAME" => '', #power bi username
        "PASSWORD" => '' # power bi password
    }

    end
end
