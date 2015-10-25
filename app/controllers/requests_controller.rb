class RequestsController < ApplicationController

  def create
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

<<<<<<< Updated upstream
  def update
    request = Request.find(params['obj'])
    status = params['status']
    request.status = status
    request.save
    event = Event.find(params['event'])
    redirect_to event_path(params['event'])

=======
  def destroy
    if event.students.include?(current_user)
      event.slots += 1
      event.save
      event.requests.where( event_id: event, user_id: current_user ).delete_all
      flash[:notice] = 'Successfully unsubscribed!'
    else
      flash[:danger] = 'You are not subscribed!'
    end

    redirect_to event_path(params['event'])
  end

  private

  def event
    @event ||= Event.find(params['event'])
>>>>>>> Stashed changes
  end

end
