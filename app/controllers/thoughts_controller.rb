class ThoughtsController < ApplicationController
  def new
    @thought = Thought.new
  end

  def create
    @thought = Thought.new(thought_params)
    @thought.message_id = params[:message_id]
    if @thought.save
      redirect_to conversation_message_path(params[:conversation_id], params[:message_id])
    else
      @errors = @thought.errors.full_messages
      render :new
    end
  end

  private
  
  def thought_params
    params.require(:thought).permit(:text, :sent_date)
  end
end
