class IndustriesController < ApplicationController
  def index
    @industries = Industry.all
    render :index
  end
end
