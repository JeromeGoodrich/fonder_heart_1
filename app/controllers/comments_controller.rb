class CommentsController < ApplicationController
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
    @comment.user_id = params[:user_id]
    @comment.calendar_id = params[:calendar_id]
    @comment.event_id = params[:event_id]
    @comment.body = params[:body]
    @comment.activity_id = params[:activity_id]

    if @comment.save
      redirect_to "/events/#{@comment.event_id}", :notice => "Comment created successfully."
    else
      render 'new'
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
