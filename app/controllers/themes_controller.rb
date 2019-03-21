class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

  # GET /themes
  # GET /themes.json
  def index
    @themes = Theme.all.paginate(:page => params[:page], :per_page => 20)
      @renderer = custom_paginate_renderer
  end

  # GET /themes/1
  # GET /themes/1.json
  def show
  end

  # GET /themes/new
  def new
    @theme = Theme.new
  end

  # GET /themes/1/edit
  def edit
  end

  # POST /themes
  # POST /themes.json
  def create
    @theme = Theme.new(theme_params)
      
      if @theme.save
          flash[:success] = "Le thème a bien été crée."
         redirect_to @theme 
      else
          flash[:error] = "Le thème n'a pas été crée, le nom du thème est requis, ainsi que la description et le futur de départ"
          render :new
      end
  end

  # PATCH/PUT /themes/1
  # PATCH/PUT /themes/1.json
  def update
      
      if @theme.update(theme_params)
         flash[:success] = "Le thème a été mis à jour"
          redirect_to @theme
      else
          flash[:error] = "Le thème n'a pas pu être mis à jour, le nom du thème est requis, ainsi que la descripion et le futur de départ"
          render :edit
      end
  end

  # DELETE /themes/1
  # DELETE /themes/1.json
  def destroy
    @theme.destroy
    flash[:warning] = "Le thème a été supprimé"
      redirect_to themes_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theme_params
      params.require(:theme).permit(:nom, :description, :futur_id)
    end
end
