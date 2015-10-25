class VisitorsController < ApplicationController

	before_action :authenticate_user!, only: [:my_events]

	expose(:events) { my_events }

	private

	def my_events
		return current_user.events if current_user.has_role? (:teacher)
		current_user.requests.each_with_object([]) do |request, events|
			events << request.event
		end
	end

end
