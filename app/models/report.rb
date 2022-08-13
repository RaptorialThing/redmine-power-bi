class Report < ActiveRecord::Base
    has_many :user_report

    def self.power_bi_config

    {
        "AUTHORITY_HOST" => 'login.microsoftonline.com',
        "TENANT" => "e754ed58-f367-4b04-b2f4-c4d9ccb3a4de",
        "CLIENT_ID" => '790f26fd-00b1-4c5c-afda-54b2b6ffd21d',
        "CLIENT_SECRET" => '.md8Q~m.W0AAFV2.jKlNQXt~BhL5qxTH7hoSTbuI',
        "RESOURCE" => 'https://analysis.windows.net/powerbi/api',
        "USERNAME" => 'rubinecc@116.ru',
        "PASSWORD" => 'Gh123456!'
    }

    end
end
