class RequestsController < ApplicationController

  def create
    event = Event.find(params['event'])

    if event.students.include?(current_user)
      flash[:danger] = 'Already joined to workshops!'
    elsif event.slots == 0
      flash[:danger] = 'No empty slots!'
    else
      event.slots -= 1
      event.save
      event.users << current_user
      flash[:notice] = 'Joined to workshops!'
    end

    redirect_to event_path(params['event'])
  end
end
