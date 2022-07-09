class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  def index
    @companies = Company.all

    render json: @companies
  end

  # GET /companies/1
  def show
    if @company
      render json: @company
    else
      render json: {"error": "No such Free Company exists"}, :status :not_found
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created # location: @company - redirects handled in React
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :slogan, :rank, :ff_id, :members, :server)
    end
end
