class EvaluationsController < ApplicationController
  expose(:evaluation, attributes: :evaluation_params)

  def new
    request = Request.find(params[:request])
    evaluation.event = request.event
    evaluation.user = request.user
  end

  def create
    evaluation.event_id = params[:parameters][:event_id]
    evaluation.user_id = params[:parameters][:user_id]
    if evaluation.save
      flash[:notice] = 'User evaluated successfully'
    else
      flash[:danger] = 'Something went wrong'
    end
    redirect_to event_path(evaluation.event)
  end

  private
    def evaluation_params
      params.require(:evaluation).permit(:reading, :writing, :listening)
    end
end
