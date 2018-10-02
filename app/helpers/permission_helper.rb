module PermissionHelper
    def can_create_post
       if (current_user.present?) &&
         ((@group.is_member? current_user) && 
         (@group.post_for_day_and_user(Time.zone.today, current_user).blank?))
            return true
       end
       return false
    end

    def can_create_comment
       current_user.present?
    end
end