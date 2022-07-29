class ReviewsController < ApplicationController
  before_action :get_company, except: [:user_reviews]
  before_action :set_review, only: [:show, :update, :destroy]
  before_action :authenticate_user, only: [:update, :destroy]
  before_action :check_ownership, only: [:update, :destroy]

  # GET /reviews
  def index
    @reviews = []
    @company.reviews.each do |review|
      @reviews << review.transform_review
    end

    #Returns text/rating/author, and if it is associated with a user, sends username/user_id
    render json: @reviews
  end

  def user_reviews
    @reviews = []
    Review.find_by_user(params[:username]).each do |review|
      @reviews << review.context_reviews
    end
  end

  # GET /reviews/1
  def show
    render json: @review.transform_review
  end

  # POST /reviews
  def create
    @review = @company.reviews.create(review_params)
    if current_user
      @review.user = current_user
      @review.author = null
    end
    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private

    def check_ownership
      if !(current_user.isAdmin || current_user.id != @review.user.id)
        render json: {error: "Unauthorised to complete this action."}
      end
    end

    #set the Company to post the review to
    def get_company
      @company = Company.find(params[:company_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = @company.reviews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:company_id, :text, :rating, :author)
    end
end
