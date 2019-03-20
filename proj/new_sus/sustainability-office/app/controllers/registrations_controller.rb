class RegistrationsController < ApplicationController

  def new
    @meeting = Meeting.find(params[:meeting_id])

    if session[:user_id] != nil
      @person = Person.find(session[:user_id])
    else
      flash[:notice] = "Sign in to register"
      redirect_to meeting_path(@meeting.id) and return
    end
    @registration = Registration.new
  end

  def create
    update_params = create_update_params
    @person = Person.find(session[:user_id])
    @meeting = Meeting.find(update_params[:meeting_id])
    @registration = Registration.new(update_params)

    if Registration.exists?(@person, @meeting)
      flash[:notice] = "You are already registered for #{@meeting.title}"
      redirect_to meeting_path(@meeting.id) and return
    elsif @meeting.is_past?
      flash[:notice] = "You cannot register for a past event. Please see our upcoming events"
      redirect_to meeting_path(@meeting.id) and return
    end

    #update points
    update_points(@person, @meeting)

    if @registration.save && @person.save
      flash[:notice] = "Successfully registered for #{@meeting.title}. +#{@meeting.points} Points"

      redirect_to meeting_path(@meeting.id) and return
    else
      flash[:error] = "Error adding event"
      redirect_to meeting_path(@meeting.id) and return
    end
  end

  def edit
  end

  def show
  end

  private
  def create_update_params
    params.require(:registration).permit(:person_id, :meeting_id)
  end

  def update_points(person, meeting)
    if person.points == nil
      person.points = meeting.points
    else
      person.points += meeting.points
    end
  end
end
