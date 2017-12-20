# frozen_string_literal: true

class CoinsController < ApplicationController
  before_action :require_task

  # POST /coins
  def create
    @task.coins.create(unit: current_user.default_unit)
    redirect_to tasks_path, notice: "Coin was successfully created."
  end

  # DELETE /coins
  def destroy
    @task.coins.last&.destroy
    redirect_to tasks_path, notice: "Coin was successfully destroyed."
  end

  private

  def require_task
    @task = current_user.tasks.find(params[:task_id])
  end
end
