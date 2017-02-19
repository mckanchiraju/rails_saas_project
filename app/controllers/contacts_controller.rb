class ContactsController < ApplicationController
  #GET request to /contact-us
  def new
    @contact = Contact.new
  end
  #POST request /Contats
  def create
    #Mass assignment of form fields. 
    @contact = Contact.new(contact_params)
    if @contact.save
      #Store form fields into name, email and body
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comment]
      ContactMailer.contact_email(name, email, body).deliver
      #flash messages to indicate success or failure in saving the data into the databse. 
      flash[:success] = "Message Sent."
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private 
    # To colect data from form, we need to use
    # Strong parameters and whitelist the form fields. 
    def contact_params
      params.require(:contact).permit(:name, :email, :comment)
    end
end