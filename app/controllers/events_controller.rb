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



def show
  @event = Event.find(params[:id])
end

# def subscribe
#   @event = Event.find(params[:id])
#   if @event.attendees.include? current_user
#     flash[:error] = "Vous participez déjà à l'évènement !"
#     redirect_to @event
#   end
#
#   @amount = @event.price
#
#   	  customer = Stripe::Customer.create(
#   	    :email => params[:stripeEmail],
#   	    :source  => params[:stripeToken]
#   	  )
#
#   	  charge = Stripe::Charge.create(
#   	    :customer    => customer.id,
#   	    :amount      => @amount,
#   	    :description => 'Rails Stripe customer',
#   	    :currency    => 'eur'
#   	  )
#
#   @event.attendees << current_user
#   flash[:success] = "Vous participez à l'évènement !"
#
#   	rescue Stripe::CardError => e
#   	  flash[:error] = e.message
#   	  redirect_to new_charge_path
#   	end
end
