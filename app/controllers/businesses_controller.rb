class BusinessesController < ApplicationController
  def new
    @industry = Industry.find(params[:industry_id])
    @business = @industry.businesses.new
  end

  def create
    @industry = Industry.find(params[:industry_id])
    @business = @industry.businesses.new(business_params)
    if @business.save
      redirect_to industry_path(@business.industry)
    else
      render :new
    end
  end

  def edit
    @industry = Industry.find(params[:industry_id])
    @business = Business.find(params[:id])
    render :edit
  end

  def update
    @industry = Industry.find(params[:industry_id])
    @business = Business.find(params[:id])

    if @business.update(business_params)
      redirect_to industry_path(@industry)
    else
      render :edit
    end
  end

  def destroy
    @industry = Industry.find(params[:industry_id])
    @business = Business.find(params[:id])
    
    @business.destroy
    redirect_to industry_path(@industry)
  end

private
  def business_params
    params.require(:business).permit(:name, :phone, :address, :website, :hours)
  end
end
