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

	def show
		binding.pry
		@name = params[:name]
		@password = params[:password]

		@male = params[:gender]
		@female = params[:genderr]
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes!(user_params)
			redirect_to user_profile_path
		else
			render 'edit'
		end
	end

	def sign_in
		binding.pry
        @name = params[:User_name]
		@password = params[:Password]

		@male = params[:male]
		@female = params[:female]

		user = User.find { |u| u.User_name == params[:User_name]}

		if (user.present? && user.Password.eql?(params[:Password]))
			session.clear
			session[:current_user_id] = user.id
			redirect_to user_show_path(name: params[:User_name], password: params[:Password], gender: params[:male], genderr: params[:female])
		else
		 flash[:error] = "Incorrect Password!----Please Enter correct Password"
		 render 'user_login'
		end
  	end

	def sign_out
		session.clear
	    redirect_to user_user_login_path
	end
	
	def register_new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
		redirect_to  user_user_login_path
		else
		render 'register_new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:User_name, :Email, :Password, :Confirm_password, :Mobile_number, :Gender, :Address)
	end
end
