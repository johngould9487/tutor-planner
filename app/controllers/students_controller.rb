class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :update, :destroy]

  def show
    @lessons = @student.lessons.sort_by { |lesson| lesson.date }
    @newLesson = Lesson.new
    @newStudent = Student.new
    @markers = [
      {
        lat: @student.latitude,
        lng: @student.longitude
      }
    ]
    @student.promote_to_most_recent
  end

  def create
    @student = Student.new(student_params)
    @student.user = current_user
    @student.tag = 0
    @student.save
    redirect_to student_path(@student)
  end

  def update
    @student.update(student_params)
    redirect_to student_path(@student)
  end

  def destroy
    @student.destroy
  end

  private

  def student_params
    params.require(:student).permit(:name, :address, :situation)
  end

  def find_student
    @student = Student.find(params[:id])
  end
end
