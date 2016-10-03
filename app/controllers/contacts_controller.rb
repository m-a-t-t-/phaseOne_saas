class ContactsController < ApplicationController #function that adds what we want same as in the model file
    def new
        @contact = Contact.new #this creates a object in the servers memory (blanks comntact object) we use this in the view file, @contact must be declared here
    end
    
    def create
    end
end
