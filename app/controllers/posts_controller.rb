class PostsController < ApplicationController
    def index
      @posts = Post.all
    end
    
    def show
      @post = Post.find(params[:id])
      @comments = @post.comments
    end

    def new 
      @group = current_user.group
      # @date = Time.zone.today

    end

    def create
      @post = Group.find(post_valid_param[:group_id]).add_post(Time.zone.today, current_user, post_valid_param[:body])
      if @post.save 
         redirect_to @post 
        # format.json { render action: 'show', status: :created, location: @post }
      else
        @group = current_user.group
        # @date = Time.zone.today
       render action: 'new' 
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

    private

    def post_valid_param
      params.require(:post).permit(:group_id, :date, :body)
    end

end
