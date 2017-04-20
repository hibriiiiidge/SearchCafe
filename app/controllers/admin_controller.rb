class AdminController < ApplicationController
    before_action :user_admin?
    def user_admin?
        #redirect_to '/' unless current_user.admin?
        unless current_user.role == "admin"
            redirect_to '/' 
        end
    end
end