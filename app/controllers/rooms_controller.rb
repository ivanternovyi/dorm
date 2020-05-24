# TODO: IMPORTANT add role management for actions

class RoomsController < ApplicationController
  before_action :find_room, except: %i[index new create]

  def index
    @rooms = Room.page(params[:page])
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def update
    @room.assign_attributes(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  def destroy
    @room.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def find_room
    @room ||= Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(
      :name, :max_tenants, :floor, :beds_count,
      :balcony, :fridge, :microwave, :avatar
    )
  end
end
