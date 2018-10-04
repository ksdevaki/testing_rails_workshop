class CommentsController < ApplicationController
    before_filter :authenticate_user

    before_action :set_post
    def new
    #   @comment = Post.find(params[:post_id]).comments.new
    @comment = @post.comments.new
    end

    def create
        comment = Comment.new
        comment.post = @post
        comment.user =current_user
        comment.body = comment_params[:body]
        @comment = @post.add_comment comment
        if @comment 
            redirect_to post_path(@post)
        else
            # redirect_to post_path(@post)
            render "new"
        end
    end

    private
    def set_post
        @post = Post.find params[:post_id]
    end
    def comment_params
        params.require(:comment).permit(:body)
    end
end
