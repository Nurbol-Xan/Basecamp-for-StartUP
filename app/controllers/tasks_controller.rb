class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_post
  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @subtasks =  @task.answers.order(created_at: :desc)
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  def bulk_update
    @selected_tasks =  Task.where(id: params.fetch(:tasks_ids, []).compact)

    if params[:commit] == 'disabled'
      @selected_tasks.update_all(status: :disabled)
    elsif params[:commit] == 'active'
      @selected_tasks.update_all(status: :active)
    end

    redirect_to post_path(@post)
  end

  # POST /tasks or /tasks.json
  def create
    @task = @post.tasks.create(task_params)
    @task.user = current_user

    if @task.save
      flash[:notice] = "Task has been created"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Task has not been created"
      redirect_to post_path(@post)
    end
    # @task = Task.new(task_params)

    # respond_to do |format|
    #   if @task.save
    #     format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
    #     format.json { render :show, status: :created, location: @task }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update

    @task = @post.tasks.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to post_url(@post), notice: 'Task was successfully updated.' }
      else
        format.html { redirect_to post_url(@post), alert: 'Task was not updated.' }
      end
    end
    # respond_to do |format|
    #   if @task.update(task_params)
    #     format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
    #     format.json { render :show, status: :ok, location: @task }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task = @post.tasks.find(params[:id])
    @task.destroy
    redirect_to post_path(@post)
    # @task.destroy

    # respond_to do |format|
    #   format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:body)
    end
end
