class AdminController < ApplicationController
    before_action :user_admin?
    #管理者かどうかの判定
    def user_admin?
        #adminでなければredirectする処理
        unless current_user.role == "admin"
            redirect_to '/'
        end
    end
end
