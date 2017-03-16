require 'httparty'
require 'json'

class Kele
    include HTTParty
    
    def initialize(email, password)
        @base_url = 'https://www.bloc.io/api/v1'
        options = {
            body: {
                password: password,
                email: email
            }
        }
        
        response = self.class.post("#{@base_url}/sessions", options)
        @auth_token = response['auth_token']
        
        if response.nil? || response['auth_token'].nil?
            raise ArgumentError.new("The system was unable to authorize you.")
        end
    end
    
    def get_me
        response = self.class.get("#{@base_url}/users/me", headers: { "authorization": @auth_token })
        # puts ">>> response: #{response.inspect}"
        JSON.parse(response.body)
    end
end
