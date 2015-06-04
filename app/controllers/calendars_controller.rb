class CalendarsController < ApplicationController
  def index
    @calendars = current_user.calendars
  end

  def show
    @calendar = Calendar.find(params[:id])
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new
    @calendar.user_id = current_user.id
    @calendar.title = params[:title]
    @calendar.description = params[:description]

    if @calendar.save
      redirect_to "/calendars", :notice => "Calendar created successfully."
    else
      render 'new'
    end
  end

  def edit
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])

    @calendar.user_id = params[:user_id]
    @calendar.title = params[:title]
    @calendar.description = params[:description]

    if @calendar.save
      redirect_to "/calendars", :notice => "Calendar updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])

    @calendar.destroy

    redirect_to "/calendars", :notice => "Calendar deleted."
  end
end
