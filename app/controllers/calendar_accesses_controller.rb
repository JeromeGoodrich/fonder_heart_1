class CalendarAccessesController < ApplicationController

  before_action :ensure_current_user, :only => [:index, :show, :edit, :update, :destroy]

  def ensure_current_user
    @calendar_accesses = CalendarAccess.find(params[:id])
    if @calendar_accesses.user_id != current_user.id
      redirect_to root_url, :alert => "Sorry, you are not authorized to view this page"
    end

  end


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
