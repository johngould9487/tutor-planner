class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Lesson.all
  end

  def show
  end

  def new
    @student = Student.find(params[:student_id])
    @lesson = Lesson.new
  end

  def create
    @student = Student.find(params[:student_id])
    @lesson = Lesson.new(lesson_params)
    @lesson.student = @student
    @lesson.save
    redirect_to student_path(@student)
  end

  def edit
  end

  def update
    @lesson.update(lesson_params)
    redirect_to student_path(Student.find(params[:student_id]))
  end

  def destroy
    @lesson.destroy
  end

  private

  def lesson_params
    params.require(:lesson).permit(:theme)
  end

  def find_lesson
    @lesson = lesson.find(params[:id])
  end
end
