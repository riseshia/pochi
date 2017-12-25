# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy done]

  # GET /tasks
  def index
    @tasks = current_user.tasks.includes(:category, :coins)
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @categories = Category.all
  end

  # GET /tasks/1/edit
  def edit
    @categories = Category.all
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user = current_user

    if @task.save
      redirect_to root_path, notice: "Task was successfully created."
    else
      @categories = Category.all
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to root_path, notice: "Task was successfully updated."
    else
      @categories = Category.all
      render :edit
    end
  end

  # POST /tasks/1/done
  def done
    @task.toggle!(:done)
    redirect_to root_path, notice: "Task was successfully updated."
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:name, :category_id)
  end
end
