class GigsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :show]
  before_action :is_admin?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @gigs = Gig.all.order_list(params[:sort_by]).page(params[:page]).per(10)
    @users = User.all
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)
    @gig.user = current_user
    if @gig.save
      redirect_to @gig
    else
      flash[:error] = @gig.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @gig = Gig.find(params[:id])
    @proposals = @gig.proposals.order(created_at: :desc)
    @awarded_proposal = Proposal.where(id: @gig.awarded_proposal).first
  end

  def edit
    @gig = Gig.find(params[:id])
    if current_user != @gig.user
      flash[:error] = "You are not the owner"
      redirect_to @gig
    end
  end

  def update
    @gig = Gig.find(params[:id])
    if current_user == @gig.user
      @gig.update(gig_params)
    else
      flash[:error] = "You are not the owner"
    end
    redirect_to @gig
  end

  def destroy
    @gig = Gig.find(params[:id])
    if current_user == @gig.user
      @gig.destroy
    else
      flash[:error] = "You are not the owner"
    end
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
    @gigs = Gig.where(user_id: current_user).order(created_at: :desc)
  end

  def download_file
   redirect_to paperclip_attachment.file.url
  end

  private
    def gig_params
      params.require(:gig).permit(:name, :description, :budget, :location, :open, :category_id, :skill_list, :awarded_proposal, :time_off_id, :experience, :responsabilities, :offer)
    end

    def is_admin?
      unless current_user.admin?
        flash[:notice] = 'No tienes permisos para postear'
        redirect_to root_path
      end
    end

end
