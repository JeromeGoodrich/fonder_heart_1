class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new
    @activity.name = params[:name]
    @activity.starting_time = params[:starting_time]
    @activity.ending_time = params[:ending_time]
    @activity.user_id = params[:user_id]
    @activity.event_id = params[:event_id]
    @activity.description = params[:description]
    @activity.image = params[:image]

    if @activity.save
      redirect_to "/activities", :notice => "Activity created successfully."
    else
      render 'new'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    @activity.name = params[:name]
    @activity.starting_time = params[:starting_time]
    @activity.ending_time = params[:ending_time]
    @activity.user_id = params[:user_id]
    @activity.event_id = params[:event_id]
    @activity.description = params[:description]
    @activity.image = params[:image]

    if @activity.save
      redirect_to "/activities", :notice => "Activity updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    @activity.destroy

    redirect_to "/activities", :notice => "Activity deleted."
  end
end
