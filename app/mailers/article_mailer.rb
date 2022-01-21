class ArticleMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.article_created.subject
  #
  def article_created
    @article = params[:article]
    image_path = 'app/assets/images/emails/random.jpg'
    attachments['random.jpg'] = File.read(image_path)

    mail(
      to: email_address_with_name(User.first.email, User.first.first_name),
      cc: User.all.pluck(:email, :first_name).map { |email, name| email_address_with_name(email, name) },
      bcc: 'admin@admin.com',
      subject: 'New Article was created'
    )
  end
end
