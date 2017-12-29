require 'net/http'
require "base64"
require "json"

Facter.add(:cloud_meta_facts) do
  setcode do

    if Facter.value(:ec2_metadata)
      userdata_text = ""
      begin
        userdata_text = Net::HTTP.get('169.254.169.254', '/latest/user-data')
      rescue
        # Any errors probably mean we are not on EC2
        nil
      end

      matches = /cloud_meta_facts=([a-zA-Z0-9=]+)/.match(userdata_text)
      if matches then
        begin
          decoded = Base64.decode64(matches[1])
          JSON.parse(decoded)
        rescue
          nil
        end
      end

    else
     nil
    end
  end
end
