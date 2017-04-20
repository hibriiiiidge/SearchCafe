class ToppagesController < ApplicationController
  def index
    @current_owner = Owner.find_by(user_id: current_user )

    @area_array = ['渋谷', '表参道', '代官山', '恵比寿']
    @repre_area_shops = []
    @area_array.each do | value |
      @area_shop_num = Shop.where(:area => "#{value}" ).count
      @repre_area_shop = Shop.offset(rand(@area_shop_num)).where(:area => "#{value}").first
      @repre_area_shops << @repre_area_shop
    end

    if params[:order] == "like"
      @allshop = Shop.all.order("id DESC")
      @allshop.each do |shop|
        @shop = Shop.order(shop.likes.count)
      end
      @test = "A"
      @params = params[:order]
    else
      @shop = Shop.all.order("id DESC")
      @test = "B"
      @params = params[:order]
    end

  end

  def show
    @current_owner = Owner.find_by(user_id: current_user )

    @likes = Like.where(user_id: current_user)
    shop_ids = @likes.map{|like| like.shop_id}
    @shops = Shop.find(shop_ids)
  end
end
