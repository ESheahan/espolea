class ReviewsController < ApplicationController
  before_action :authenticate_user!

  # GET /reviews
  # GET /reviews.json
  def index
      @reviews = current_user.reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
     @review = current_user.reviews.find(params[:id])
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = current_user.reviews.new(review_params)
 
    
      if @review.save
        redirect_to reviews_path
      else
         render :new 
      end
    
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
        redirect_to @review, notice: 'Review was successfully updated.' 
        
    else
      render :edit 
    end
  
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :rating, :body)
    end
end
