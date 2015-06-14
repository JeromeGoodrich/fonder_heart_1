class ActivitiesController < ApplicationController
  def index
    @activities = current_users.activities
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
    @activity.starting_time = Chronic.parse(params[:starting_time])
    @activity.ending_time = Chronic.parse(params[:ending_time])
    @activity.user_id = current_user.id
    @activity.event_id = params[:event_id]
    @activity.description = params[:description]
    @activity.image = params[:image]

    if @activity.save
      redirect_to "/events/#{@activity.event_id}", :notice => "Activity created successfully."
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
    @activity.starting_time = Chronic.parse(params[:starting_time])
    @activity.ending_time = Chronic.parse(params[:ending_time])
    @activity.user_id = params[:user_id]
    @activity.event_id = params[:event_id]
    @activity.description = params[:description]
    @activity.image = params[:image]

    if @activity.save
      redirect_to "/events/#{@activity.event_id}", :notice => "Activity updated successfully."
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
