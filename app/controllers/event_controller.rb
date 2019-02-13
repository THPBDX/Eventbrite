class EventController < ApplicationController
before_action :authenticate_user!, only: [:secret]
  def index
    render '/home'
  end
end
