class SnacksController < ApplicationController

  def show
    @snack = Snack.find(params[:id])
    #ran out of time due to back and forth emailing with landlord
    # would have gotten @snack.machines sent the view at the very least
  end

end
