module ApplicationHelper
    
    def texteCourt(texte)
       if texte.length > 10
          return texte[0,10] + '...'
       else
           return texte
       end
    end
    
    def booleanToText(boolean)
       if boolean
          return "Oui" 
       else
           return "Non"
       end
    end
    
end
