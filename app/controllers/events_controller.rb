class EventsController < ApplicationController

  before_action :ensure_current_user, :only => [:index, :show, :edit, :update, :destroy]

  def ensure_current_user
    @events = Event.find(params[:id])
    if @events.user_id != current_user.id
      redirect_to root_url, :alert => "Sorry, you are not authorized to view this page"
    end

  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.user_id = current_user.id
    @event.calendar_id = params[:calendar_id]
    @event.name = params[:name]
    @event.starting_time = Chronic.parse(params[:starting_time])
    @event.ending_time = Chronic.parse(params[:ending_time])
    @event.description = params[:description]
    @event.image = params[:image]

    if @event.save
      redirect_to "/calendars/#{@event.calendar_id}", :notice => "Event created successfully."
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.user_id = params[:user_id]
    @event.calendar_id = params[:calendar_id]
    @event.name = params[:name]
    @event.starting_time = params[:starting_time]
    @event.ending_time = params[:ending_time]
    @event.description = params[:description]

    if @event.save
      redirect_to "/events", :notice => "Event updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy
  repsond_to do |format|

  end
    redirect_to "/events", :notice => "Event deleted."
  end
end
