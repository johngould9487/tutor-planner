class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      if !current_user.students.count.zero?
        @student = current_user.students.first
      end
    end
    @newStudent = Student.new
  end
end
