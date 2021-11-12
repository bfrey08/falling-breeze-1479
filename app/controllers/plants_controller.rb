class PlantsController < ApplicationController
  def index
  @invoices = Invoice.all
  end
  
end
