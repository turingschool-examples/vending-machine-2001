class SnacksController < ApplicationController

  def show
    @snack = Snack.find(params[:id])
    # binding.pry
  end
end