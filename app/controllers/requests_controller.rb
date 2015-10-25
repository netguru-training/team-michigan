class RequestsController < ApplicationController
  def create
    event = Event.find(params['event'])
    request = Request.create(user: current_user, event: event)
    if request.save &&  event.slots > 0
      event.slots -= 1
      event.save
      flash[:success] = "Joined to workshops!"
    else
      flash[:danger] = "Couldn't join to workshops. No empty slots!"
    end
    redirect_to event_path(params['event'])
  end
end
