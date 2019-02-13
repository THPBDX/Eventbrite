class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new

  end

  def show
    @event=Event.find(params[:id])
    @end_date = @event.start_date + @event.duration*60
    @participants = Attendance.where(event: @event)
    puts @participants
    @participants_count = @participants.count
  end

  def destroy

  end

  def edit
  end

  def create
    @event = event.create!(title: params[:title],description: params[:description],organiser: current_user, start_date: params[:start_date], duration: params[:duration], price: params[:price])

    if @event.save # essaie de sauvegarder en base @event
      render "/events/show"
    else
      render "/events/new"
    end
  end
end
