class CompaniesController < ApplicationController
  
  before_action :find_company, only: [:show]
  
  def show
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end
end