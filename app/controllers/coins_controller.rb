# frozen_string_literal: true

class CoinsController < ApplicationController
  # POST /coins
  def create
    @coin = Coin.new(coin_params)
    @coin.unit = current_user.default_unit

    if @coin.save
      redirect_to tasks_path, notice: "Coin was successfully created."
    end
  end

  # DELETE /coins/1
  def destroy
    Coin.find(params[:id]).destroy
    redirect_to tasks_path, notice: "Coin was successfully destroyed."
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def coin_params
    params.require(:coin).permit(:task_id)
  end
end
