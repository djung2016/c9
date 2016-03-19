class ActivityController < ActionController::Base
  skip_before_action :authenticate, only: :show

  def index
    @activity = Activity.all
  end
  
  def show
    @activity = Activity.find_by(id: params[:id])  
  end


  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new
    @activity.name = params[:activity][:name]
    @activity.save
    redirect_to activity_url
  end
  # add activity_id dropdown on views
  
  def edit
    @activity = Activity.find_by(id: params[:id])
  end

  def update
    @activity = Activity.find_by(id: params[:id])
    @activity.name = params[:activity][:name]
    @activity.save
    redirect_to activity_url
  end
  
  def destroy
    @activity = Activity.find_by(id: params[:id])
    @activity.destroy
    redirect_to activity_url
  end

end