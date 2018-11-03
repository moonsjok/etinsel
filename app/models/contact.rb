class Contact < MailForm::Base
  attribute :nom,      :validate => true
  attribute :prenom,   :validate => true
  attribute :sujet,    :validate => true
  
  #attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  #attribute :file,      :attachment => true

  attribute :message
  #attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "ETINSEL | FORMULAIRE DE CONTACT",
      :to => "team@triooti.com",
      :from => %("#{nom} #{prenom}", "<no-reply@etinsel.com>")
    }
  end
end 