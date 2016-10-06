class ContactsController < ApplicationController #function that adds what we want same as in the model file
    def new # new is connected to a view file > new.html.erb
        @contact = Contact.new #this creates a object in the servers memory (blank contact object) we use this in the view file, @contact must be declared here
    end
    
    def create
        @contact = Contact.new(contact_params) #creating another object filling it with the parameters WHITE LISTED BELOW
        
        if @contact.save # save the contact data to the database / commiting it saves the contact object at the sametime as applying logic
            name = params[:contact][:name] #create variables that are the same as in view and function calling the view file below - they are called by funciton below as well
            email = params[:contact][:email] #hash syntax 
            body = params[:contact][:comments]
            ContactMailer.contact_email(name, email, body).deliver #run the mailer file and deliver - call it
            flash[:success] = 'Message Sent.'
            redirect_to new_contact_path # save => true then run this # send user back to blank form page
        else
            flash[:danger] = 'Error occured, message has not been sent.'
            redirect_to new_contact_path # if false run this
        end
    end
    
    
private
    def contact_params #has to be the same name as code within the ().
        params.require(:contact).permit(:name, :email, :comments) # White Listing the parameters
    end
end
