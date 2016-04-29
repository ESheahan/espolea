class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_conflict, only: [:create, :update]

  # GET /reviews
  # GET /reviews.json
  def index
      @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
     @review = current_user.reviews.find(params[:id])
  end

  # GET /reviews/new
  def new

    @selected_clinic = Clinic.find_by(id: params[:clinic_id])

    @review = current_user.reviews.new
  end

  # GET /reviews/1/edit
  def edit
    @is_edit = true
    @review = current_user.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create

    @review = current_user.reviews.new(review_params)
    @review[:clinic_id] = params[:review][:clinic_id]
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
    
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review = current_user.reviews.find(params[:id])
    @review[:clinic_id] = params[:review][:clinic_id]
    if @review.update(review_params)
        redirect_to reviews_path, notice: 'Review was successfully updated.' 
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

  def retrieve_both
    user = User.find_by(id: params[:user_id])
    review = Review.find_by(id: params[:review_id])
    
    if review.helpful_list_id 
        in_helpful = review.helpful_list_id.include? user
    else
        in_helpful = false
    end

    if review.unhelpful_list_id
        in_unhelpful = review.unhelpful_list_id.include? user
    else
        in_helpful = false
    end

    data = [user, review, in_helpful, in_unhelpful]
    return data
  end


  # POST /helpful/add/:review_id/:user_id
  def add_helpful
    user, review, _helpful, _unhelpful = retrieve_both 

    if user and review
        if not _helpful
            if _unhelpful
                review.unhelpful_list_id.delete(user)
            end

            if review.helpful_list_id
                review.helpful_list_id << user
            else
                review.helpful_list_id = user
                #review.save!
            end

        end
    end
    redirect_to request.referer
  end

  # POST /helpful/remove/:review_id/:user_id
  def remove_helpful
      user, review, _helpful, _unhelpful = retrieve_both

      if user and review and _helpful
          review.helpful_list_id.delete(user)
      end
  end


  # POST /unhelpful/add/:review_id/:user_id
  def add_unhelpful
      user, review, _helpful, _unhelpful = retrieve_both

      if user and review
          if not _unhelpful
              if _helpful
                  review.helpful_list_id.delete(user)
              end
              review.unhelpful_list_id << user
          end
      end
      redirect_to request.referer

  end

  # POST /unhelpful/remove/:review_id/:user_id
  def remove_unhelpful
      user, review, _helpful, _unhelpful = retrieve_both

      if user and review and _unhelpful
          review.unhelpful_list_id.delete(user)
      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def check_conflict
        if current_user
            if current_user.clinics_id and current_user.clinics_id == params[:review][:clinic_id].to_i
                #Trying to create a review for own clinic -- conflict of interest
                redirect_to request.referer and return
            else
                return true
            end
        else
            #No logged in user -- can't create review
            redirect_to request.referer and return
        end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :rating, :body)
    end
end
