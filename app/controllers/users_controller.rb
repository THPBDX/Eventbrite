class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user_id, except: [:show]



  def show
    @user = User.find(params[:id])
    @events = Event.where(organiser: @user)
  end

  def edit
    @user = User.find(params[:id])

  end

  def update

    @user = user.find(params[:id])
    if @user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
      redirect_to @user
    else
      render :edit
    end

  end



  def authenticate_user_id
    unless current_user.id == params[:id]
      redirect_to '/users/sign_up'
    end
  end

end
