class ConversationsController < ApplicationController
  def index
    if(params[:search].present?)
      @search = "%#{params[:search]}%"
      @conversations = Conversation.where(
        'title ILIKE ? ', @search
      ).group(:id).order(:start_date)
      if @conversations.present?
        render :index
      else
        redirect_to root_path
      end
    else
      @conversations = Conversation.includes(:messages).order(:start_date).all
    end
  end

  def show
    @conversation = Conversation.find_by(id: params[:id])
    if @conversation
      @sorted_msgs = @conversation.messages.order(:sent_date)     
      render :show
    else
      redirect_to root_path
    end
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      @errors = @conversation.errors.full_messages
      render :new
    end
  end

  private
  
  def conversation_params
    params.require(:conversation).permit(
      :title, :start_date
    )
  end
end
