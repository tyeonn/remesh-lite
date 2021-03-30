class MessagesController < ApplicationController
  def index
    if(params[:search_msg].present?)
      @search_msg = "%#{params[:search_msg]}%"
      @messages = Message.joins(:conversation).where(
        'conversation_id = ? and text ILIKE ?', 
        params[:conversation_id], @search_msg
      ).select(
        'messages.id, text, sent_date, conversation_id, 
        conversations.title as c_title, conversations.start_date as c_date'
      ).order(:sent_date)
      if @messages.present?
        render :index
      else
        redirect_to conversation_path(params[:conversation_id])
      end
    else
      redirect_to conversation_path(params[:conversation_id])
    end
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.conversation_id = params[:conversation_id]
    if @message.save
      redirect_to conversation_path(@message.conversation_id)
    else
      @errors = @message.errors.full_messages
      render :new
    end
  end

  def show
    @message = Message.joins(:conversation).select(
      'messages.id, text, sent_date, conversation_id, conversations.title as c_title'
    ).find_by(id: params[:id])
    if @message.present?
      @sorted_thoughts = @message.thoughts.order(:sent_date)     
      render :show
    else
      redirect_to conversation_path(params[:conversation_id])
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :sent_date)
  end
end
