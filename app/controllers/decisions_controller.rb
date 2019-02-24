class DecisionsController < ApplicationController
  before_action :set_decision, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

  # GET /decisions
  # GET /decisions.json
  def index
    @decisions = Decision.all.includes(:user, :futur, :theme)
  end

  # GET /decisions/1
  # GET /decisions/1.json
  def show
  end

  # GET /decisions/new
  def new
    @decision = Decision.new
  end

  # GET /decisions/1/edit
  def edit
  end

  # POST /decisions
  # POST /decisions.json
  def create
    @decision = Decision.new(decision_params)
      
      if @decision.save
          flash[:success] = "La décision est enregistrée."
         redirect_to @decision 
      else
          flash[:error] = "La décision n'a pas été enregistrée."
          render :new
      end
  end

  # PATCH/PUT /decisions/1
  # PATCH/PUT /decisions/1.json
  def update
      
      if @decision.update(decision_params)
         flash[:success] =  "La décision a été mise à jour."
          redirect_to @decision
      else
          flash[:error] = "La décision n'a pas été mise à jour."
          render :edit
      end
  end

  # DELETE /decisions/1
  # DELETE /decisions/1.json
  def destroy
    @decision.destroy
    flash[:success] = "La décision a bien été supprimée."
      redirect_to decisions_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decision
      @decision = Decision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decision_params
      params.require(:decision).permit(:titre, :description, :theme_id, :first_decision, :futur_ids)
    end
end
