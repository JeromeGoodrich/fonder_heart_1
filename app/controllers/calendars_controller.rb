class CalendarsController < ApplicationController

  before_action :ensure_current_user, :only => [:show, :edit, :update, :destroy]

  def ensure_current_user
    @calendars = Calendar.find(params[:id])
    @calendar_access = CalendarAccess.find_by(calendar_id: @calendars.id)
      if @calendars.user_id == current_user.id
      elsif @calendar_access.user_id != current_user.id
      redirect_to root_url, :alert => "Sorry, you are not authorized to view this page"
      end



  end


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
    @calendar.title = params[:calendar][:title]
    @calendar.description = params[:description]
    @calendar.image = params[:image]

    if @calendar.save!
      redirect_to :back, :notice => "Calendar created successfully."
    else
      render 'new'
    end
  end

  def edit
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])

    @calendar.user_id = current_user.id
    @calendar.title = params[:calendar][:title]
    @calendar.description = params[:description]

    if @calendar.save
      redirect_to :back, :notice => "Calendar updated successfully."
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
