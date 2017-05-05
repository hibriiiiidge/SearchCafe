class MessageroomsController < ApplicationController
  before_action :set_messageroom, only: [:destroy]

  def index
    @current_owner = Owner.find_by(user_id: current_user)
    @current_owner_shops = Shop.where(owner_id: @current_owner)
    @messageroom = Messageroom.where(user_id: current_user.id)
    #@current_owner_shops_messageroom = Messageroom.where(shop_id: @current_owner_shops)
    #binding.pry
  end

  def create
      @messageroom = Messageroom.new(messageroom_params)
      respond_to do |format|
          if @messageroom.save
              #binding.pry
              @msg_id = @messageroom.messages.first.messageroom_id
              #binding.pry
              format.html { redirect_to message_path(@msg_id), notice: 'Messageroom was successfully created.' }
              format.json { render :show, status: :created, location: @messageroom }
          else
              format.html { render root_path }
              format.json { render json: @messageroom.errors, status: :unprocessable_entity }
          end
      end
  end

  def destroy
    @messageroom.destroy
    respond_to do |format|
      format.html { redirect_to messagerooms_path, notice: 'Messageroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_messageroom
    @messageroom = Messageroom.find(params[:id])
  end

  #params user_id
  #params shop_id
  #params messageroom_id
  #params content
  #user_id
  def messageroom_params
    params.require(:messageroom).permit(:user_id, :shop_id, messages_attributes: [:messageroom_id, :content, :user_id])
  end

end
