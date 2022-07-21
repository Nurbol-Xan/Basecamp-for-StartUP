class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /posts or /posts.json


  def index 
    @posts = Post.all.order(created_at: :desc)
    @post_users = PostUser.all.order(created_at: :desc)
    @users = User.all.order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
    # @post.post_users.each do |post_user|
    #   if post_user.content == current_user.email
    #     @post.views = 1
    #     if current_user != @post.user
    #       @post.update(views: @post.views + 1)
    #     end
    #     @comments = @post.comments.order(created_at: :desc) 
    #     @tasks = @post.tasks.order(created_at: :desc)
    #     @discussions = @post.discussions.order(created_at: :desc)
    #     @post_users = @post.post_users.order(created_at: :desc)
    #   end
    # end

    # if current_user == @post.user 
      @post.views = 1
      if current_user != @post.user
        @post.update(views: @post.views + 1)
      end
      @tasks = @post.tasks.order(created_at: :desc)
      @discussions = @post.discussions.order(created_at: :desc)
      @post_users = @post.post_users.order(created_at: :desc)
    # else
    #   redirect_to post_url(@post), alert: "You can't go there!" 
    # end
    
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post_users = @post.post_users.order(created_at: :desc)
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  def delete_file
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge
    redirect_back fallback_location: root_path, notice: "success"
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_post
      @post = Post.find(params[:id])
    end

   
    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :description, files: [])
    end
end
