class FuturMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.futur_mailer.envoi.subject
  #
  def envoi(user, foo)
      
      @nom_user = user.pseudo
      @mail = user.email
      @foo = foo

    mail(to: @mail, subject: "Résultats de votre futur")
  end
end
