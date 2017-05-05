class Owner::UsersController < ApplicationController
    before_action :set_owner, only: [:edit, :update, :destroy]

    def new
        @user = User.find(current_user.id)
        @owner = Owner.new(user_id:@user.id)
    end

    def edit
        @current_owner = Owner.find_by(user_id: current_user )
    end

    def create
        @owner = Owner.new(owner_params)
        respond_to do |format|
            if @owner.save
                format.html { redirect_to root_path, notice: 'Owner was successfully created.' }
                format.json { render :show, status: :created, location: @owner }
            else
                format.html { render :new }
                format.json { render json: @owner.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
          if @owner.update(owner_params)
            format.html { redirect_to root_path, notice: 'Owner was successfully changeed.' }
            format.json { render :show, status: :ok, location: @owner }
          else
            format.html { render :edit }
            format.json { render json: @owner.errors, status: :unprocessable_entity }
          end
        end
    end

    private
    def set_owner
        @owner = Owner.find(params[:id])
    end

    #params user_id     ユーザid
    #params username    ユーザ名
    #params email       メール
    #params avatarurl   アバター
    #params password    パスワード@TODO
    def owner_params
        params.require(:owner).permit(:user_id, :last_name, :first_name, :company_name, :company_address, :company_tel)# :password
    end
end
