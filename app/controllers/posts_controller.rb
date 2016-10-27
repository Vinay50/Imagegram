class PostsController < ApplicationController
	before_action :find_post, :only => [:destroy, :edit, :update,]
	before_action :authenticate_user!,  :only =>  [:new, :create, :destroy,:edit, :update]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find (params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post =  current_user.posts.build(posts_params)
		if @post.save
			flash[:success]  = "Your post has been created!"
			redirect_to @post
	      else
	         flash[:error]	= " Post could not be created! Please check errors!."
	         render :new
	       end
	end

	def edit
	end

	def update
		if @post.update(posts_params)
			flash[:success] = "Post has been updated"
			redirect_to @post
		else
		   flash[:error]  = "Post could not be updated!"
		   render :edit
		end	
	end

	private 

	def posts_params
		params.require(:post).permit(:image, :caption)
	end

	def find_post
		@post = Post.find_by(params[:id])
	end
end
