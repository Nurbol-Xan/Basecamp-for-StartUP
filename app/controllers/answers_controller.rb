class AnswersController < ApplicationController
  before_action :authenticate_user!
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
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers or /answers.json
  def create
    @post = Post.find(params[:post_id])
    @discussion = @post.discussions.find(params[:discussion_id])
    @answer = @discussion.answers.create(answer_params)
    @answer.user = current_user

    if @answer.save
      flash[:notice] = "Answer has been created"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Answer has not been created"
      redirect_to post_path(@post)
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    @post = Post.find(params[:post_id])
    @discussion = @post.discussions.find(params[:discussion_id])
    @answer = @discussion.answers.find(params[:id])
    
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to post_url(@post), notice: 'Answer was successfully updated.' }
      else
        format.html { redirect_to post_url(@post), alert: 'Answer was not updated.' }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer = @discussion.answers.find(params[:id])
    @answer.destroy

    redirect_to post_path(@post)

    # respond_to do |format|
    #   format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:body)
    end
end
