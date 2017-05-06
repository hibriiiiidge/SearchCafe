class ShopsController < ApplicationController
    before_action :set_current_owner, only: [:index, :show]

    def index
        @area = params[:area]
        #エリアに該当するショップ一覧を取得
        @shops = Shop.where(:area => @area)
    end

    def show
        @shop = Shop.find(params[:id])
        @message = Message.new
        @messageroom = Messageroom.new
        @messageroom.messages.build
    end

    private

    def set_current_owner
        @current_owner = Owner.find_by(user_id: current_user )
    end

end
