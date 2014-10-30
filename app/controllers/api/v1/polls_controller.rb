class API::V1::PollsController < API::V1::BaseApiController
  actions :index, :show
  skip_before_filter :verify_authenticity_token, only: [:answer_poll]

  def answer_poll
    @poll = Poll.find(params[:id])
    @answer = @poll.answers.find(get_answer_id)
    respond_to do |format|
      @answer.answers_count = (@answer.answers_count || 0) + 1
      if @answer.save
        format.json{ render "show.json" }
      else
        format.json{ render json: {errors: @poll.errors.full_messages } }
      end
    end
  end

  private

  def get_answer_id
    (permit_answer.fetch(:poll, {}) || {}).fetch(:answer, nil)
  end

  def permit_answer
    params.permit(poll: [:answer, ])
  end
end
