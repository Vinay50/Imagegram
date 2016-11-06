class ProfilesController < ApplicationController
	before_action :set_user, :only => [:edit, :update, :show]
	before_action  :authenticate_user! 

	def show
		@posts = User.find_by(username: params[:username]).posts.order("created_at DESC") 
	end

	def edit
	end

	def update
      	if  @user.update(profile_params)  
	          	flash[:success] = "Your profile updated"
	            redirect_to	profile_path(@user.username)
            else
            	flash[:error] = @user.errors.full_messages 	
          		redner :edit
	      end
	end

	def set_user
	  	@user = User.find_by(username: params[:username])
	end

	def profile_params
		params.require(:user).permit(:username,  :bio, :dob,  :phone_number, :gender, :location, :avatar)
	end
end
