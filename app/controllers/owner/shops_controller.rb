class Owner::ShopsController < ApplicationController
    before_action :set_shop, only: [:edit, :update, :destroy]

    def index
        @current_owner = Owner.find_by(user_id: current_user )
        @shop = Shop.where(owner_id: @current_owner.id )
        #@have_ranking=Have.group(:item_id).limit(10).order('count_item_id DESC').count('item_id')
    end

    def new
        @shop = Shop.new
        @shop.shopimages.build
        @shop.menuimages.build
        @current_owner = Owner.find_by(user_id: current_user )
        #binding.pry
    end

    def create
        @shop = Shop.new(shop_params)

        respond_to do |format|
            if @shop.save
                format.html { redirect_to owner_shops_path, notice: 'Shop was successfully created.' }
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
            format.html { redirect_to owner_shops_path, notice: 'Shop was successfully changeed.' }
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
          format.html { redirect_to owner_shops_path, notice: 'Shop was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    private

    def set_shop
        @shop = Shop.find(params[:id])
    end

    def shop_params
      params.require(:shop).permit(:name, :area, :postal_code1, :postal_code2, :address, :email, :tel, :url, :image1, :owner_id, shopimages_attributes: [:shop_id, :image, :remove_image], menuimages_attributes: [:shop_id, :image, :remove_image])
    end
end
