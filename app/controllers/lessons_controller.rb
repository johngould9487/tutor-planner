class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :update, :destroy]

  def show
  end

  def create
    @student = Student.find(params[:student_id])
    @lesson = Lesson.new(lesson_params)
    @lesson.student = @student
    @lesson.save
    redirect_to student_path(@student)
  end

  def update
    @lesson.update(lesson_params)
    redirect_to student_path(Student.find(params[:student_id]))
  end

  def destroy
    @student = Student.find(params[:student_id])
    @lesson.destroy
    redirect_to student_path(@student)
  end

  private

  def lesson_params
    params.require(:lesson).permit(:theme, :description, :date)
  end

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end
end
