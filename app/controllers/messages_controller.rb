class MessagesController < ApplicationController

  def show
    @current_owner = Owner.find_by(user_id: current_user)
    @messageroom = Messageroom.find(params[:id])
    @messages = Message.where(messageroom_id: @messageroom)
    # @test = []
    # @test2 = []
    # @messages.each do |message|
    #   if message.shop_id?
    #     @test << message.shop
    #   else
    #     @test2 << message.user
    #   end
    # end
    #binding.pry
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

  def message_params
    params.permit(:messageroom_id, :content, :user_id, :shop_id)
  end
end
