class CommentsController < ApplicationController
	before_action :require_user
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params.require(:comment).permit(:body))
		@comment.creator = current_user

		if @comment.save
			flash[:notice] = "Your comment has been saved."
			redirect_to post_path(@post)
		elsif 
			render 'posts/show'
		end
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end






