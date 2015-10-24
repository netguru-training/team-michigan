class EventsController < ApplicationController

	expose(:event, attributes: :event_params)

	# def new
	# end

	def create
		binding.pry
		if event.save
			redirect_to(event)
		else
			render :new
		end
	end

	def edit
		if event.save
			redirect_to(event)
		else
			render :edit
		end
	end

	private

	def event_params
		params.require(:event).permit(:place, :start_time, :user_deadline, :name, :description, :slots)
	end

end
