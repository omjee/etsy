class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_listing
  before_action :check_user, only: [:edit, :update, :destroy]

  respond_to :html

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end
 

  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.listing_id = @listing.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to root_path, notice: 'review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
