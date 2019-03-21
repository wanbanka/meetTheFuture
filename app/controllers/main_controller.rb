class MainController < ApplicationController
    
    before_action :all_params, only: [:index, :choice, :predict]
    before_action :predict, only: [:predictun, :predictdeux]
    
   def index
       $foo = []
   end
    
    def choice
        @index = 0
        @theme = Theme.find(params[:id])
        @futur_one = @theme.futur.id
        @collect_decisions = Decision.where("first_decision AND theme_id = #{params[:id]} AND futur_id = #{@futur_one}")
        
        if $foo.length > 1
           $foo = [] 
        end
        
        $foo.push(@futur_one)
        @tableau_textes = []
        
        @collect_decisions.each do |decision|
            @futur_suivant_texte = decision.second_futur
            @id_futur_suivant = Futur.where("titre = \"#{@futur_suivant_texte}\"")
            @id_futur_suivant.each do |futur|
               @tableau_textes.push(futur.id) 
            end
        end
    end
    
    def predictun
        if $foo.length > 2
           $foo = [$foo[0], $foo[1]]
        end
    end
    
    def predictdeux
        if $foo.length > 3
           $foo = [$foo[0], $foo[1], $foo[2]]
        end
    end
    
    def conclude
        @theme = Theme.find(params[:theme])
        @futur = Futur.find(params[:id])
        $foo.push(@futur.id)
    end
    
    def submit
        FuturMailer.envoi($user, $foo).deliver_now
    end
    
    private
    
    def all_params
       @themes = Theme.all
        @decisions = Decision.all
        @futurs = Futur.all
        $foo
        $user
    end
    
    def predict
        @index = 0
        @futur = Futur.find(params[:id])
        @theme = Theme.find(params[:theme])
        @collect_decisions = Decision.where({first_decision: false, theme_id: params[:theme], futur_id: @futur.id})
        $foo.push(@futur.id)
        @tableau_textes = []
        
        @collect_decisions.each do |decision|
            @futur_suivant_texte = decision.second_futur
            @id_futur_suivant = Futur.where("titre = \"#{@futur_suivant_texte}\"")
            @id_futur_suivant.each do |futur|
               @tableau_textes.push(futur.id) 
            end
        end
    end
end