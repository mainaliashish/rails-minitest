class ArticleMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.article_created.subject
  #
  def article_created
    @article = params[:article]
    mail to: @article.user.email,
         subject: 'Your New Article was created'
  end
end
