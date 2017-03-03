class GigsController < ApplicationController
  def index
    @gigs = Gig.all.order_list(params[:sort_by]).page(params[:page]).per(10)
    @users = User.all
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)
    @gig.save
    redirect_to @gig
  end

  def show
    @gig = Gig.find(params[:id])
    @proposals = @gig.proposals.order(created_at: :desc)
    @awarded_proposal = Proposal.where(id: @gig.awarded_proposal).first
  end

  def edit
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])
    @gig.update(gig_params)
    redirect_to @gig
  end

  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy
    redirect_to mygigs_path
  end

  def search
    if params[:category].blank? && params[:search].blank?
      @gigs = Gig.all.order(created_at: :desc).page(params[:page]).per(10)
    else
      @gigs = Gig.search(params).page(params[:page]).per(10)
    end
  end

  def mygigs
    @gigs = Gig.where(user_id: current_user).order(created_at: :asc)
  end

  private
    def gig_params
      params.require(:gig).permit(:name, :description, :budget, :location, :open, :category_id, :skill_list, :awarded_proposal)
    end

end
