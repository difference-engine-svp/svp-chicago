class RfpRatingsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @invite_max = InviteMax.first.max
    @yes_ratings = RfpRating.where(user_id: current_user.id).where(q5: 'Yes')
    gon.current_user_id = current_user.id

    if user_signed_in? && current_user.admin
      @ratings = RfpRating.all

      respond_to do |format|
        format.html
        format.csv { send_data @ratings.to_csv, filename: "ratings-#{Date.today}.csv" }
      end
    else
      @ratings = RfpRating.where(user_id: current_user.id)

      respond_to do |format|
        format.html
        format.csv { send_data @ratings.to_csv, filename: "ratings-#{Date.today}.csv" }
      end
    end

  end

  def show
    @rating = RfpRating.find(params[:id])
  end

  def new
    @rating = RfpRating.new
    @loi_id = params[:loi]
  end

  def create
    @rating = RfpRating.new(
      user_id: current_user.id,
      loi_id: params[:loi_id],
      q1: params[:q1],
      q2: params[:q2],
      q3: params[:q3],
      q5: params[:q5],
      weighted_score: 5
    )
    if @rating.save
      redirect_to '/ratings'
      flash[:success] = "Rating Submitted!"
    else
      redirect_to :back
      flash[:warning] = "Missing elements in rating!"

    end
  end

  def edit
    @rating = RfpRating.find(params[:id])
  end

  def update
    @rating = RfpRating.find(params[:id])
    @rating.update(
      user_id: current_user.id,
      q1: params[:q1],
      q2: params[:q2],
      q3: params[:q3],
      q5: params[:q5],
      weighted_score: 5
    )
    if @rating.save
      redirect_to '/lois'
      flash[:success] = "Rating Updated!"
    else
      redirect_to :back
      flash[:warning] = "Missing elements in rating!"

    end
  end
end