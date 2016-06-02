class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :owned_post, only: [:edit, :update, :destroy] 

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post, notice: "Your Post has been CREATED !!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Post was successfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def upvote
 		@post.upvote_by current_user
 		redirect_to :back
	end


	private

	def post_params
		params.require(:post).permit(:title, :description, :image)
	end

	def find_post
		@post = Post.find(params[:id])
	end

	def owned_post
		unless current_user == @post.user
			flash[:alert] ="That post doesn't belong to you!"
			redirect_to root_path
		end
	end

end
