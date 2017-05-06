class ToppagesController < ApplicationController
  def index
    #ログインユーザーidからオーナー情報を取得
    @current_owner = Owner.find_by(user_id: current_user )
    @area_array = ['渋谷', '表参道', '代官山', '恵比寿'] #@TODO エリアname => エリアidに変更
    @repre_area_shops = []
    #エリア毎の処理
    @area_array.each do | value |
      #エリアに属するショップのカウント
      @area_shop_num = Shop.where(:area => "#{value}" ).count
      #1番最初に表示されるショップをランダムで選択
      @repre_area_shop = Shop.offset(rand(@area_shop_num)).where(:area => "#{value}").first
      @repre_area_shops << @repre_area_shop
    end

    #@TODO 並び替え
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
    #ユーザidからオーナー情報を取得
    @current_owner = Owner.find_by(user_id: current_user )
    #Likeの中でユーザーidに該当するものを取得
    @likes = Like.where(user_id: current_user)
    #@likesのショップidを取得
    shop_ids = @likes.map{|like| like.shop_id}
    @shops = Shop.find(shop_ids)
  end
end
