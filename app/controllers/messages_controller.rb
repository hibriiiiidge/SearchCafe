class MessagesController < ApplicationController

  def show
    #ユーザidからオーナー情報を取得
    @current_owner = Owner.find_by(user_id: current_user)
    #パラメータidからメッセージ箱を取得
    @messageroom = Messageroom.find(params[:id])
    #メッセージ箱のidからメッセージ一覧を取得
    @messages = Message.where(messageroom_id: @messageroom)
  end

  def create
    @message = Message.new(message_params)
    @messageroom = Messageroom.find(params[:messageroom_id])
    #binding.pry
    respond_to do |format|
      if @message.save
        #format.html { redirect_to message_path(@message.messageroom_id), notice: 'Message was successfully created.' }
        #format.json { render :show, status: :created, location: @message.messageroom_id }
        #binding.pry
        format.js
      else
        format.html { render root_path }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  #params integer  メッセージ箱
  #params string  メッセージ内容
  #params integer ユーザーid
  #params integer ショップid
  def message_params
    params.permit(:messageroom_id, :content, :user_id, :shop_id)
  end
end
