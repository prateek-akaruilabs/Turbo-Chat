class RoomsController < ApplicationController
    before_action :authenticate_user!

    def index
        @room = Room.new
        @rooms = Room.public_rooms
        @single_room = Room.find_by(id: params[:id])
        @users = User.all_except(current_user)
        render 'index'
    end

    def create
        @room = Room.create(name: params[:room][:name])
    end

    def show
        @room = Room.new
        @rooms = Room.public_rooms
        @single_room = Room.find_by(id: params[:id])
        @users = User.all_except(current_user)
        @message = Message.new
        @messages = @single_room.messages.order(created_at: :asc)
        render 'index'
    end
end
