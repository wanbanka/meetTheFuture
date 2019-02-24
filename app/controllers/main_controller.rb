class MainController < ApplicationController
   def index
       @themes = Theme.all
   end
    
    def choice
        @theme = Theme.find(params[:id])
        @decisions = Decision.where("theme_id = #{params[:id]}")
    end
    
    def predict
    end
end