module ApplicationHelper

    def is_logged_in?
        !current_user.nil?
    end

    def current_user
        User.find_by(id: session[:user_id])
    end
end
