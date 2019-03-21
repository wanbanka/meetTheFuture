class UsersController < ApplicationController
    def show
    end
    
    def create
    @user = User.new(user_params)
        @user.creating = true
    if @user.save
      log_in @user
      flash[:success] = "Bienvenue, vous êtes bien inscrit"
      redirect_to @user
    else
      render 'new'
    end
  end
    
    def update
       @user.creating = false
        if @user.update_attributes(user_params)
           flash[:success] = "Vous avez modifié des informations"
        else
            render 'edit' 
        end
    end
end