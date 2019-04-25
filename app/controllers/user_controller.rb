class UserController < ApplicationController
	def index
		#@user = User.all
	end

	def about
		# @name = params[:User_name]
		# @password = params[:Password]
		# @male = params[:male]
		# @female = params[:female]
	end
    def profile
    	@user = User.find(params[:id])
    	@cc = Course.all
        if @user.present? && params[:course_ids]
	        # =@user = User.find(params[:user][:id])
	        @courses = Course.find(params[:course_ids])
	        @user.courses<<@courses
	        redirect_to user_profile_path
    	end
    	#@courses = Course.find(params[:user][:course_ids])
    	#@user.courses<<@courses
    end
	def show
		@name = params[:name]
		@password = params[:Password]
		@Gender = params[:Gender]
		@tyype = params[:tyype]
		@hidden = params[:email]
		@hobbies = params[:hobbies]
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes!(user_params)
			redirect_to user_profile_path(id: params[:id])
		else
			render 'edit'
		end
	end

	def sign_in
        @name = params[:User_name]
		@password = params[:Password]
		@Gender = params[:Gender]
		@type = params[:tyype]
		@hidden = params[:email]
		@hobbies = params[:hobbies]

		user = User.find { |u| u.User_name == params[:User_name]}
		if (user.present? && user.Password.eql?(params[:Password]))
			session.clear
			session[:current_user_id] = user.id
		  redirect_to user_profile_path(id: user[:id])
			#redirect_to user_profile_path(name: params[:User_name], password: params[:Password], Gender: params[:Gender], tyype: params[:tyype], email: params[:email],hobbies: params[:hobbies])
			#redirect_to user_show_path(name: params[:User_name], password: params[:Password], Gender: params[:Gender], tyype: params[:tyype], email: params[:email],hobbies: params[:hobbies])
		else
		 flash[:error] = "Incorrect Password!----Please Enter correct Password"
		 render 'about'
		end
  	end

	def sign_out
		session.clear
	    redirect_to user_about_path
	end
	
	def register_new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
		redirect_to  user_about_path
		else
		render 'register_new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:User_name, :Email, :Password,
		 :Confirm_password, :Mobile_number, :Gender, :Address, :tyype=>[], :hobbies=>[])
	end
end
