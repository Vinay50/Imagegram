class CommentsController < ApplicationController	
     before_action :authenticate_user!,  :only =>  [:create, :destroy]
     before_action :find_post

	def index
	end

     def create
     	     @comment = @post.comments.build(comment_params)
     	     @comment.user_id = current_user.id
     	     if @comment.save!
     	     	respond_to do |format|
     	     		format.html {redirect_to root_path}
     	     		format.js
     	      end		
     	      else
     	        	flash[:alert] = "Check the comment form, something went horribly wrong."
                   render :new		
            end      
     end

     def destroy
         @comment = @post.comments.find(params[:id])
          if @comment.user_id == current_user.id 
                if @comment.delete
                    respond_to do |format|
                      format.html {redirect_to root_path}
                      format.js 
                    end
                end
            end
      end      

     def find_post
     		@post = Post.find(params[:post_id])
     end

     def comment_params
     		params.require(:comment).permit(:content)
     end
end