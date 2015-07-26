class CommentsController < ApplicationController

  before_action :ensure_current_user, :only => [:index, :show, :edit, :update, :destroy]

  def ensure_current_user
    @comments = Comment.find(params[:id])
    if @comments.user_id != current_user.id
      redirect_to root_url, :alert => "Sorry, you are not authorized to view this page"
    end

  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.calendar_id = params[:calendar_id]
    @comment.event_id = params[:event_id]
    @comment.body = params[:comment][:body]
    @comment.activity_id = params[:comment][:activity_id]

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to :back, :notice => "Comment created successfully."
        end
        format.js do
          render('create.js.erb')
        end
      else
        render 'new'
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.user_id = params[:user_id]
    @comment.calendar_id = params[:calendar_id]
    @comment.event_id = params[:event_id]
    @comment.body = params[:comment][:body]

    if @comment.save
      redirect_to "/comments", :notice => "Comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    respond_to do |format|
      format.html do
        redirect_to :back, :notice => "Comment deleted."
      end
      format.js do
        render('destroy.js.erb')
      end
    end
  end
end
