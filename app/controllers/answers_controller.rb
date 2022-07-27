class AnswersController < ApplicationController
  before_action :set_post
  before_action :set_discussion
  before_action :set_answer, only: %i[ show edit update destroy ]

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1 or /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = @discussion.answers.build
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers or /answers.json
  def create
    @answer = @discussion.answers.build(answer_params)
    @answer.user = current_user
    @answer.user_id = current_user.id
    discussion_id = "discussion-" + @discussion.id.to_s


    respond_to do |format|
      if @answer.save
        format.html { redirect_to post_path(@post, :anchor => discussion_id), notice: "Answer was successfully created." }
      else
        format.html { redirect_to post_path(@post), alert: "Answer was not successfully created." }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to post_path(@post), notice: "Answer was successfully updated." }
      else
        format.html { redirect_to post_path(@post), alert: "Answer was not successfully update." }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "Answer was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    
    def set_post
      @post = Post.find(params[:post_id])
    end

    
    def set_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:body)
    end
end
