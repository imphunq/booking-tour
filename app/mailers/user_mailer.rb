class UserMailer < ApplicationMailer
  default from: "phube232@gmail.com"

  def order_email order, user=nil, mail
    @order = order
    @user = user
    mail(to: mail, subject: t("mailers.user_mailer.success"))
  end
end
