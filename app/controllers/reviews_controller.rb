class ReviewsController < ApplicationController
  before_action :get_company
  before_action :set_review, only: [:show, :update, :destroy]
  # before_action :authenticate_user, only: [:update, :destroy]

  # GET /reviews
  def index
    @reviews = @company.reviews

    #Returns text/rating/author, and if it is associated with a user, sends username/user_id
    render :json => @reviews.to_json( :include => { :user => {:only => [:username, :id] }},
    :only => [:text, :rating, :author])
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = @company.reviews.build(review_params)
    if current_user 
      @review.user = current_user
      @review.author = current_user
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
      params.require(:review).permit(:user_id, :company_id, :text, :rating, :author)
    end
end
