module VisitorsHelper
  def evaluation_status(event)
    if current_user.has_role? :student
      if evaluation_exist?(event)
        "Evaluated"
      else
        "Not evaluated"
      end
    end
  end

  private
  def evaluation_exist?(event)
    !Evaluation.where(event_id: event.id, user_id: current_user.id).empty?
  end
end
