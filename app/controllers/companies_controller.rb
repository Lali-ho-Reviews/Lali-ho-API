class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  def index
    @companies = Company.includes(:categories).all

    render json: @companies.as_json(include: { categories: { only: :title } })
  end

  # GET /companies/1
  def show
    if @company
      render json: @company.as_json(include: { categories: { only: :title } })
    else
      render json: {"error": "No such Free Company exists"}, status: :not_found
    end
  end

  def search
    @companies = Company.search_by_name(params[:name])

    render json: @companies.as_json(include: { categories: { only: :title } })
  end

  def search_category
    search = params[:category]
    @companies = Company.includes(:categories).where( :categories => {title: search})
    render json: @companies.as_json(include: { categories: { only: :title } })
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
      @company = Company.includes(:categories).find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :slogan, :rank, :ff_id, :members, :server, :category)
    end
end
