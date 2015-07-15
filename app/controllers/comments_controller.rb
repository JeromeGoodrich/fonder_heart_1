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
    @comment.body = params[:body]
    @comment.activity_id = params[:activity_id]

    respond_to do |format|
      if @comment.save
        format.html {redirect_to "/events/#{@comment.event_id}", :notice => "Comment created successfully."}
        format.js
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
    @comment.body = params[:body]

    if @comment.save
      redirect_to "/comments", :notice => "Comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to "/comments", :notice => "Comment deleted."
  end
end

