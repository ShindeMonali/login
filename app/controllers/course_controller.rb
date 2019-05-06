class CourseController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    #@course = Course.find(course_params[:id])
    @course = Course.new(course_params)
    if @course.save


      #@course = Course.find(course_params[:id])
        redirect_to course_show_path(id: @course.id)
      else
        render 'new'
      end
  end

  def edit
    # binding.pry
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to user_index_path(id: params[:id])
    else
      render 'edit'
    end
  end 

  def show
    @course = Course.all
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to course_show_path
  end

  def course_params
    params.require(:course).permit(:id, :name, :description, :start_time, :end_time, :level, :mode =>[], :images =>[])
  end
  
end