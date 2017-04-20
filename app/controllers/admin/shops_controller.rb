class Admin::ShopsController < AdminController
    before_action :set_shop, only: [:edit, :update, :destroy]
    
    def index
        @shop = Shop.includes(:owner).all
        @current_owner = Owner.find_by(user_id: current_user )
    end
    
    def new
        @shop = Shop.new
    end
    
    def edit
    end
    
    def create
        @shop = Shop.new(shop_params)
    
        respond_to do |format|
            if @shop.save
                format.html { redirect_to admin_shops_path, notice: 'Shop was successfully created.' }
                format.json { render :show, status: :created, location: @shop }
            else
                format.html { render :new }
                format.json { render json: @shop.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def update
        respond_to do |format|
          if @shop.update(shop_params)
            format.html { redirect_to admin_shops_path, notice: 'Shop was successfully changeed.' }
            format.json { render :show, status: :ok, location: @shop }
          else
            format.html { render :edit }
            format.json { render json: @shop.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def destroy
        @shop.destroy
        respond_to do |format|
          format.html { redirect_to admin_shops_path, notice: 'Shop was successfully destroyed.' }
          format.json { head :no_content }
        end
    end
    
    
    private
    
    def set_shop
        @shop = Shop.find(params[:id])
    end
    
    def shop_params
      params.require(:shop).permit(:name, :area, :address, :email, :tel, :url, :image1)
    end

end