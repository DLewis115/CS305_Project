class GamesController < ApplicationController
before_action :logged_in_teacher
layout 'application', :except => [:chapter_four]

def chapter_four
   @in_game = true;
   @student = Student.find_by(id: params[:game][:student_id])
   session[:player] = @student.id
end

def student_select
  @student = Student.all 
  @student = @student.where(active: true)
end

def save
   @student = Student.find(session[:player])
   @score = @student.scores.build(entry: params[:data_value])
   if @score.save
   session.delete(:player)
   
   end
end



private
  def logged_in_teacher
      unless logged_in?
        flash[:danger] = "Nice try"
        redirect_to login_url
      end
    end
end
