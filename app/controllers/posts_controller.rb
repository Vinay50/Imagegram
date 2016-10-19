class PostsController < ApplicationController

	def index
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

	private 

	def post_params
		params.require(:post).permit(:caption)
	end

end
