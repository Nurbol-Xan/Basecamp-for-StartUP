class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion, only: %i[ show edit update destroy ]
  before_action :set_post

  # GET /discussions or /discussions.json
  def index
    @discussions = Discussion.all
  end

  # GET /discussions/1 or /discussions/1.json
  def show
    @answers =  @discussion.answers.order(created_at: :desc) 
  end

  # GET /discussions/new      
  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions or /discussions.json
  def create
    @discussion = @post.discussions.create(discussion_params)
    @discussion.user = current_user

    if @discussion.save
      flash[:notice] = "Discussion has been created"
      redirect_to post_path(@post)
    else
      flash[:notice] = "Discussion has not been created"
      redirect_to post_path(@post)
    end
  
  end

  # PATCH/PUT /discussions/1 or /discussions/1.json
  def update
    @discussion = @post.discussions.find(params[:id])

    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to post_url(@post), notice: 'Discussion was successfully updated.' }
      else
        format.html { redirect_to post_url(@post), alert: 'Discussion was not updated.' }
      end
    end
  end

  # DELETE /discussions/1 or /discussions/1.json
  def destroy

    @discussion = @post.discussions.find(params[:id])
    @discussion.destroy
    redirect_to post_path(@post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end


    # Only allow a list of trusted parameters through.
    def discussion_params
      params.require(:discussion).permit(:content)
    end
end
