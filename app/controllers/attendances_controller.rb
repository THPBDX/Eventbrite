class AttendancesController < ApplicationController
def new

end

def create

end

def index
  @event=Event.find(params[:event_id])
end

end
