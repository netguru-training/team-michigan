module EventsHelper
  def evaluation_for_logged_student_exist?(event)
    user_signed_in? && !evaluation(event).nil? && (current_user.has_role? :student)
  end

  def evaluation_for_request_exist?(request)
    !Evaluation.where(event: request.event, user: request.user).empty?
  end

  def evaluation(event)
    Evaluation.where(event_id: event.id, user_id: current_user.id).first
  end
end
