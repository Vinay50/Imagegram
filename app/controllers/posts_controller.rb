class PostsController < ApplicationController
	before_action :set_post, :only => [:show, :edit, :update]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find_by(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post =  Post.new(post_params)
		if @post.save
			flash[:success]  = "Post has been created"
			redirect_to @post
	      else
	         flash[:error]	= " Post could not be created! Please check error."
	         render :new
	       end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Post has been updated"
			redirect_to @post
		else
		   flash[:error]  = "Post could not be updated!"
		   render :edit
		end	
	end

	private 

	def post_params
		params.require(:post).permit(:caption, :image)
	end

	def set_post
		@post = Post.find_by(params[:id])
	end
end
