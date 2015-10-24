class EventsController < ApplicationController
	expose(:events)
	expose(:event, attributes: :event_params)

 	before_action :authenticate_user!, except: [:show, :index]
	before_action :check_teacher, except: [:show, :index]


	# def new
	# end

	def create
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

	def check_teacher
		unless current_user.has_role? :teacher
      redirect_to new_user_session_path
    end
	end

end
