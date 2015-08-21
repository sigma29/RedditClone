class SubsController < ApplicationController

  before_action :require_be_moderator, only: [:edit]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save

      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end


  def index
    @subs = Sub.all.includes(:moderator)
    render :index
  end

  def edit
  end
  
  def update
  end



  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

  def require_be_moderator
    sub = Sub.find(params[:id])
    current_user.is_moderator?(sub)
    redirect_to sub_url(sub)
  end
end
