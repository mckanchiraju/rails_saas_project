class ContactMailer < ActionMailer::Base
  default to: 'mckanchiraju@gmail.com'
  
  def contact_email(name, email, body)
      @name = name
      @email = email
      @body = body
      
      mail(from: email, Subject: 'Contact Form Email')
  end
end