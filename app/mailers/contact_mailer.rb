class ContactMailer < ActionMailer::Base #Creating a class and inherting from part of the rails app - action mailer
    default to: 'matthewlewisking@gmail.com' #declare where to send email
    
    def contact_email(name, email, body) #created a method / function that has arguments below
        @name = name # taking arguments, assigning to instance vars
        @email = email
        @body = body
        
        mail(from: email, subject: 'Contact Form Message') # declaring aspects of the email
    end
end
