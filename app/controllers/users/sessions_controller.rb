class Users::SessionsController < Devise::SessionsController
    def new
        super
    end
    
    def create
        super
    end
    
    def destroy
        super
        flash[:danger] = "ログアウトしました。"
    end
end