class FutursController < ApplicationController
  before_action :set_futur, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

  # GET /futurs
  # GET /futurs.json
  def index
    @futurs = Futur.all.includes(:decision)
  end

  # GET /futurs/1
  # GET /futurs/1.json
  def show
  end

  # GET /futurs/new
  def new
    @futur = Futur.new
  end

  # GET /futurs/1/edit
  def edit
  end

  # POST /futurs
  # POST /futurs.json
  def create
    @futur = Futur.new(futur_params)
      
      if @futur.save
         flash[:success] = "Le futur a été sauvegardé."
          redirect_to @futur 
      else
          flash[:error] = "Le futur n'a pas pu être sauvegardé."
          render :new
      end
  end

  # PATCH/PUT /futurs/1
  # PATCH/PUT /futurs/1.json
  def update
      
      if @futur.update(futur_params)
          flash[:success] = "Le futur a été modifié"
         redirect_to @futur 
      else
          flash[:error] = "Le futur n'a pas pu être modifié"
          render :edit
      end
  end

  # DELETE /futurs/1
  # DELETE /futurs/1.json
  def destroy
    @futur.destroy
      flash[:warning] = "Le futur a été supprimé."
      redirect_to futurs_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_futur
      @futur = Futur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def futur_params
      params.require(:futur).permit(:titre, :description, :decision_ids)
    end
end
