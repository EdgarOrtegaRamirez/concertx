class EventsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :list]

  def index
    @events = Event.order(:date).page params[:page]
  end

  def list
    users = []
    User.find(current_user.id).followers.each do |follower|
      users.push(follower.user.id)
    end
    @events = Event.where(user_id: users).order(:date).page params[:page]
  end

  def followed
    @users = User.find(current_user.id).followers
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    @event.user = current_user

    if @event.save
      UserMailer.new_event(@event, current_user).deliver
      redirect_to events_path, :notice => "Your event was created successfully."
    else
      flash[:error] = "There were some errors creating your event."
      render action: "new"
    end 
  end

  def update
    @event = Event.find(params[:id])
  
    if @event.update_attributes(params[:event])
      UserMailer.new_event(@event, current_user).deliver
      flash[:notice] = 'Your event was edited successfully'
      redirect_to action: 'show', id: @event
    else
      flash[:error] = "There were some errors editing your event"
      render action: 'edit'
    end
  end

  def delete
  end
end