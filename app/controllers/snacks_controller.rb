class SnacksController < ApplicationController
  def index
    @snacks = Snack.all
  end
end
