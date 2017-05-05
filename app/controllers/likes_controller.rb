class LikesController < ApplicationController

    def like
        @shop = Shop.find(params[:shop_id])
        @like = current_user.likes.build(shop_id: @shop.id)
        @like.save
    end

    def unlike
        @shop = Shop.find(params[:shop_id])
        @like = current_user.likes.find_by(shop_id: @shop.id)
        @like.destroy
    end
    #ログインしていないユーザがlikeボタンをクリックした処理
    def nologin
        flash[:notice] = "ログインして下さい"
        redirect_to root_path
    end

    def all_likes_destroy
        @like = Like.all
        @like.destroy_all
        respond_to do |format|
          format.html { redirect_to admin_shops_path, notice: 'Shop was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

end
