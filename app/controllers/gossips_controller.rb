class GossipsController < ApplicationController
  before_action :ensure_login
  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossips_params)
    user = current_user
    user.gossips << @gossip
    if @gossip.save #Redirection vers la view 'show' qui affiche les détails et les options du nouveau ragot
      redirect_to @gossip
    else
      render 'new' #Redirection vers la page 'new' en cas d'échec de création d'un nouveau ragot
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
    @anonymous_author = User.find(@gossip.user_id)
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(params.require(:gossip).permit(:content))
      redirect_to @gossip
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
      @gossip.destroy
    redirect_to gossips_path
  end

  private #on ne récupère de la view que les données qui nous intéressent (anonyme_user et content) - placé ici dans le script par convention
    def gossips_params
      params.permit(:content)
    end
end
