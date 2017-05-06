##管理者のオーナー関連のコントローラー
class Admin::OwnersController < AdminController
    before_action :set_owner, only: [:edit, :update, :destroy]

    ##編集
    #一覧表示
    def index
        @owners = Owner.all
        @current_owner = Owner.find_by(user_id: current_user )
    end

    def edit
    end
    #アップデート
    def update
        respond_to do |format|
          if @owner.update(owner_params)
            format.html { redirect_to admin_owners_path, notice: 'Owner was successfully changeed.' }
            format.json { render :show, status: :ok, location: @owner }
          else
            format.html { render :edit }
            format.json { render json: @owner.errors, status: :unprocessable_entity }
          end
        end
    end
    #消去
    def destroy
        @owner.destroy
        respond_to do |format|
            format.html { redirect_to admin_owners_path, notice: 'Owner was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    #params id オーナーid
    def set_owner
        @owner = Owner.find(params[:id])
    end

    #params last_name       string  名前
    #params first_name      string  氏名
    #params company_name    string  会社名
    #params company_address string  会社住所
    #params company_tel     integer 会社連絡先
    def owner_params
        params.require(:owner).permit(:last_name, :first_name, :company_name, :company_address, :company_tel)
    end

end
