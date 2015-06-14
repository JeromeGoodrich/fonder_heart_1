class CalendarAccessesController < ApplicationController
  def index
    @calendar_accesses = current_user.calendar_accesses
  end

  def show
    @calendar_access = CalendarAccess.find(params[:id])
  end

  def new
    @calendar_access = CalendarAccess.new
  end

  def create
    @calendar_access = CalendarAccess.new
    @calendar_access.user_id = params[:user_id]
    @calendar_access.calendar_id = params[:calendar_id]

    if @calendar_access.save
      redirect_to "/calendars/#{@calendar_access.calendar_id}", :notice => "calendar shared successfully."
    else
      render 'new'
    end
  end

  def edit
    @calendar_access = CalendarAccess.find(params[:id])
  end

  def update
    @calendar_access = CalendarAccess.find(params[:id])

    @calendar_access.user_id = params[:user_id]
    @calendar_access.calendar_id = params[:calendar_id]

    if @calendar_access.save
      redirect_to "/calendar_accesses", :notice => "Calendar access updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @calendar_access = CalendarAccess.find(params[:id])

    @calendar_access.destroy

    redirect_to "/calendar_accesses", :notice => "Calendar access deleted."
  end
end
