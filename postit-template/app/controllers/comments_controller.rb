class CommentsController < ApplicationController
	before_action :require_user
	def create
		@comment = Comment.new(comment_params)
		@comment.creator = current_user
		if @comment.save
			flash[:notice] = "Your comment has been saved."
			redirect_to posts_path
		elsif 
			render 'posts/show'
		end
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end






