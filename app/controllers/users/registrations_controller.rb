class   Users::RegistrationsController < Devise::RegistrationsController
    def edit
      @current_owner = Owner.find_by(user_id: current_user )
    end
    
    def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to root_path, notice: 'User was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:username, :email, :avatarurl)# :password
    end
end