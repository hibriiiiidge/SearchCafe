class Admin::UsersController < AdminController
    before_action :set_user, only: [:edit, :update, :destroy]

    def index
        @users = User.all
        @current_owner = Owner.find_by(user_id: current_user )
    end

    def edit
    end

    def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to admin_users_path, notice: 'User was successfully changeed.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        if @user.admin?
            respond_to do |format|
                format.html { redirect_to admin_users_path, notice: 'Can not delete Admin user!!' }
            end
        else
            @user.destroy
            respond_to do |format|
                format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
                format.json { head :no_content }
            end
        end
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    #params username    string  ユーザ名
    #params email       string  メール
    #params avatarurl   string  アバター
    #params password    strign  パスワード@TODO
    def user_params
        params.require(:user).permit(:username, :email, :avatarurl)# :password
    end

end
