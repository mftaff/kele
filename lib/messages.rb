module Messages
    def get_messages(page_num=nil)
        if page_num.nil?
            all_pages ||= []
            self.class.get("#{@base_url}/message_threads", headers: { "authorization": @auth_token })["count"].times do |n|
                page = JSON.parse(self.class.get("#{@base_url}/message_threads", body: { page: n+1 }, headers: { "authorization": @auth_token }).body)
                page["items"] == [] ? break : all_pages << page
            end
            all_pages
        else
            response = self.class.get("#{@base_url}/message_threads", body: { page: page_num }, headers: { "authorization": @auth_token })
            JSON.parse(response.body)
        end
    end
    
    def create_message(subject_str="", body_str)
        mentor_id = self.get_me.dig("current_enrollment", "mentor_id")  # self requires module to be loaded in kele.rb
        my_email = self.get_me["email"]                                 # self requires module to be loaded in kele.rb
        
        self.class.post("#{@base_url}/messages", body: {
            sender: my_email, 
            recipient_id: mentor_id,
            subject: subject_str,
            'stripped-text': body_str
            }, headers: { "authorization": @auth_token })
    end
end
