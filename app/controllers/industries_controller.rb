class IndustriesController < ApplicationController
  def index
    @industries = Industry.all
    render :index
  end

  def show
    @industry = Industry.find(params[:id])
    render :show
  end

  def new
    @industry = Industry.new
    render :new
  end

  def create
    @industry =  Industry.new(industry_params)
    if @industry.save
      redirect_to industries_path
    else
      render :new
    end
  end

  def edit
    @industry = Industry.find(params[:id])
    render :edit
  end

  def update
    @industry = Industry.find(params[:id])
    if @industry.update(industry_params)
      redirect_to industries_path
    else
      render :edit
    end
  end

  def destroy
    @industry = Industry.find(params[:id])
    @industry.destroy
    redirect_to industries_path
  end

private
  def industry_params
    params.require(:industry).permit(:name)
  end

end
