class CommentsController < ApplicationController

	http_basic_authenticate_with name: "ddh", password: "secret", only: :destroy

	def create
			@blog = BlogPost.find(params[:blog_post_id])
			@comment = @blog.comments.create(comment_params)
			redirect_to blog_post_path(@blog)
	end

	def destroy
			@blog = BlogPost.find(params[:blog_post_id])
			@comment = @blog.comments.find(params[:id])
			@comment.destroy
			redirect_to blog_post_path(@blog)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
