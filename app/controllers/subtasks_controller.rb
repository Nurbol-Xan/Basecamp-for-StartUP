class SubtasksController < ApplicationController
  before_action :set_post
  before_action :set_task
  before_action :set_subtask, only: %i[ show edit update destroy ]

  # GET /subtasks or /subtasks.json
  def index
    @subtasks = Subtask.all
  end

  # GET /subtasks/1 or /subtasks/1.json
  def show
  end

  # GET /subtasks/new
  def new
    @subtask = Subtask.new
  end

  # GET /subtasks/1/edit
  def edit
  end

  # POST /subtasks or /subtasks.json
  def create
    @subtask = @task.subtasks.build(subtask_params)
    @subtask.user_id = current_user.id
    @subtask.status = :continues

    respond_to do |format|
      if @subtask.save
        format.html { redirect_to edit_post_task_path(@post, @task), notice: "Subtask was successfully created." }
      else
        format.html { redirect_to edit_post_task_path(@post, @task), alert: "Subtask was not successfully created."}
      end
    end
  end

  def bulk_update_subtasks
    @selected_subtasks =  Subtask.where(id: params.fetch(:subtasks_ids, []).compact)

    if params[:commit] == 'finished'
      @selected_subtasks.update_all(status: :finished)
    elsif params[:commit] == 'continues'
      @selected_subtasks.update_all(status: :continues)
    end

    redirect_to edit_post_task_path(@post, @task)
  end


  # PATCH/PUT /subtasks/1 or /subtasks/1.json
  def update
    respond_to do |format|
      if @subtask.update(subtask_params)
        format.html { redirect_to edit_post_task_path(@post, @task), notice: "Subtask was successfully updated." }
      else
        format.html {redirect_to edit_post_task_path(@post, @task), alert: "Subtask was not successfully update." }
      end
    end
  end

  # DELETE /subtasks/1 or /subtasks/1.json
  def destroy
    @subtask.destroy

    respond_to do |format|
      format.html { redirect_to edit_post_task_path(@post, @task), notice: "Subtask was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtask
      @subtask = Subtask.find(params[:id])
    end
    
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_task
      @task = Task.find(params[:task_id])
    end
    # Only allow a list of trusted parameters through.
    def subtask_params
      params.require(:subtask).permit(:body)
    end
end
