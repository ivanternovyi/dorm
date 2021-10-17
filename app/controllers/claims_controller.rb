# frozen_string_literal: true

class ClaimsController < ApplicationController
  before_action :authenticate_student!, only: %i[create]
  before_action :authenticate_manager, only: %i[index approve reject mark_in_progress]
  before_action :find_room
  before_action :find_claim_room, only: %i[approve reject mark_in_progress]

  # GET (/:locale)/rooms/:room_id/claims
  def index
    @claim_rooms = filter_claim_rooms(params[:filter]).page(params[:page])
  end

  # POST (/:locale)/rooms/:room_id/claims
  def create
    if current_student.claim_for_room(@room.id)
      flash[:success] = t('flash.claimed')
    else
      flash[:notice] = t('flash.already_claimed')
    end

    redirect_to room_path(@room)
  end

  # POST (/:locale)/rooms/:room_id/claims/:id/mark_in_progress
  def mark_in_progress
    @claim_room.mark_in_progress!

    redirect_to room_claims_path(@room)
  end

  # POST (/:locale)/rooms/:room_id/claims/:id/accept
  def approve
    @claim_room.approve!

    redirect_to room_claims_path(@room)
  end

  # POST (/:locale)/rooms/:room_id/claims/:id/reject
  def reject
    @claim_room.reject!

    redirect_to room_claims_path(@room)
  end

  private

  def filter_claim_rooms(filter_param)
    @claim_rooms = @room.claim_rooms

    case filter_param
    when 'new'
      @claim_rooms.new_claims
    when 'in_progress'
      @claim_rooms.in_progress
    when 'approved'
      @claim_rooms.approved
    when 'rejected'
      @claim_rooms.rejected
    else
      @claim_rooms
    end
  end

  def find_room
    @room ||= Room.find(params[:room_id])
  end

  def find_claim_room
    @claim_room ||= ClaimRoom.find_by(claim_id: params[:id], room_id: params[:room_id])
  end
end
