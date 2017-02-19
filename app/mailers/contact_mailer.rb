class ContactMailer < ActionMailer::Base
  default to: 'mckanchiraju@gmail.com'
  #the email "controller". the below action is called by the Mailer client (mailgun) to format the email thats beings ent. 
  def contact_email(name, email, body)
      @name = name
      @email = email
      @body = body
      
      mail(from: email, Subject: 'Contact Form Email')
  end
end