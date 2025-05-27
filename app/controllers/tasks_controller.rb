class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy toggle ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all.order(:created_at)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    if @task.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to tasks_path, notice: "Task successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to task_path, notice: "Task updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # TOGGLE /tasks/1/toggle
  def toggle
    @task.update(completed: !@task.completed)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to tasks_path }
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to tasks_path, notice: "Task successfully deleted." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :completed)
    end
end
