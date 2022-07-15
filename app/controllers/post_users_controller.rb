class PostUsersController < ApplicationController
  before_action :set_post_user, only: %i[ show edit update destroy ]
  before_action :set_post
  # GET /post_users or /post_users.json
  def index
    @post_users = PostUser.all
  end

  # GET /post_users/1 or /post_users/1.json
  def show
  end

  # GET /post_users/new
  def new
    @post_user = PostUser.new
  end

  # GET /post_users/1/edit
  def edit
  end

  # POST /post_users or /post_users.json
  def create
    @post_user = @post.post_users.build(post_user_params)

    if @post_user.save
      flash[:notice] = "Post user has been created #{@post_user.id}, #{@post.user_id}"
      redirect_to edit_post_path(@post)
    else
      flash[:alert] = "Post user not been created"
      redirect_to edit_post_path(@post)
    end
  end

  # PATCH/PUT /post_users/1 or /post_users/1.json
  def update
    respond_to do |format|
      if @post_user.update(post_user_params_up)
        format.html { redirect_to edit_post_path(@post), notice: "Post user was successfully updated." }
        format.json { render :show, status: :ok, location: @post_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_users/1 or /post_users/1.json
  def destroy
    @post_user = @post.post_users.find(params[:id])
    @post_user.destroy
    redirect_to posts_path

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_user
      @post_user = PostUser.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def post_user_params
      params.require(:post_user).permit(:content)
    end

    def post_user_params_up
      params.require(:post_user).permit(role: [])
    end
end
