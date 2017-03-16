class ProposalsController < ApplicationController
  before_action :is_staff?

  def create
    @gig = Gig.find(params[:gig_id])
    @proposal = @gig.proposals.build(proposal_params)
    @proposal.save
    redirect_to @proposal.gig
  end

  private
    def proposal_params
      params.require(:proposal).permit(:bid, :description, :document)
    end

    def is_staff?
      unless current_user.staff?
        flash[:notice] = 'No tienes permisos para hacer propuestas'
        redirect_to root_path
      end
    end
end
