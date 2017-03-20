module Roadmap
    def get_roadmap
        map_id = self.get_me.dig("current_enrollment", "roadmap_id") # self is dependant on kele.rb
        
        response = self.class.get("#{@base_url}/roadmaps/#{map_id}", headers: { "authorization": @auth_token })
        JSON.parse(response.body)
    end
    
    def get_checkpoint(checkpoint_id)
        # checkpoint_path = self.get_roadmap.map { |h| (h["id"] == checkpoint_id) ? h["path"] : nil }
        # response = self.class.get("#{@base_url}#{checkpoint_path}", headers: { "authorization": @auth_token })
        
        response = self.class.get("#{@base_url}/checkpoints/#{checkpoint_id}", headers: { "authorization": @auth_token })
        JSON.parse(response.body)
    end
    
    def create_submission(checkpoint_id, comment, assignment_branch=nil, assignment_commit_link=nil)
        enrollment_id = self.get_me.dig("current_enrollment", "id")
    
        self.class.post("#{@base_url}/checkpoint_submissions", body: {
            checkpoint_id: checkpoint_id,
            enrollment_id: enrollment_id,
            comment: comment,
            assignment_branch: assignment_branch,
            assignment_commit_link: assignment_commit_link
            }, headers: { "authorization": @auth_token })
    end
end
