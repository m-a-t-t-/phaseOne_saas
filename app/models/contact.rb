class Contact < ActiveRecord::Base
    validates :name, presence: true # validates the name, asks is it there?
    validates :email, presence: true # validates email
end