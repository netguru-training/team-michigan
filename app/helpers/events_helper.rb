module EventsHelper
  def evaluation_for_logged_student_exist?(event)
    user_signed_in? && !Evaluation.where(event_id: event.id, user_id: current_user.id).empty? && (current_user.has_role? :student)
  end

  def evaluation(event)
    Evaluation.where(event_id: event.id, user_id: current_user.id).first
  end
end
