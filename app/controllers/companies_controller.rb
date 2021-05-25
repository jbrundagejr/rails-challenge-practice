class CompaniesController < ApplicationController
  
  before_action :find_company, only: [:show]
  
  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    redirect_to company_path(@company)
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name)
  end

end