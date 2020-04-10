class SnacksController < ApplicationController
  def show
    @snack = Snack.find(params[:id])
    require 'pry'; binding.pry
  end
end
