class CalendarEventsController < ApplicationController
  skip_before_action :authenticate, only: :show

  def index
    @calendar_event = CalendarEvent.all
  end
  
  def show
    @calendar_event = CalendarEvent.find_by(id: params[:id])  
  end


  def new
    @calendar_event = CalendarEvent.new
  end

  def create
    @calendar_event = CalendarEvent.new(calendar_event_params)
    @calendar_event.save
    if @calendar_event.valid?
      redirect_to calendar_events_url, notice: "Event added."
    else
      render "new"
    end
  end
  # add calendar_event_id dropdown on views
  
  def edit
    @calendar_event = CalendarEvent.find_by(id: params[:id])
  end

  def update
    @calendar_event = CalendarEvent.find_by(id: params[:id])
    @calendar_event.update(calendar_event_params)
    redirect_to calendar_events_url
  end
  
  def destroy
    @calendar_event = CalendarEvent.find_by(id: params[:id])
    @calendar_event.destroy
    redirect_to calendar_events_url
  end
  
  def calendar_event_params
    params.require(:calendar_event).permit(:start_time, :end_time, :user_id, :patient_id, :activity_id, :date)
  end

end