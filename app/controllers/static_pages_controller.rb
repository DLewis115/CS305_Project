class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def add_remove_student
  end

  def help
  end
  
  def login
  end

  def create
    teacher = Teacher.find_by(name: params[:session][:name])
    if teacher && teacher.authenticate(params[:session][:password])
      log_in teacher
    redirect_to teacher
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
