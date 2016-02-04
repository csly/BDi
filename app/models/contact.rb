class Contact < MailForm::Base
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :name, validate: true
  attribute :message, validate: true

  def headers
    {
      subject: 'Demo submissions',
      to: 'csly-platz@bucksmusicgroup.co.uk',
      from: %("#{name}" <#{email}>)
    }
  end
end
