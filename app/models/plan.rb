class Plan < ActiveRecord::Base
    has_many :users #symbol syntax - associates plan with user
end
#application is now aware that it has a plan object
#an object is a list of attributes that are related to a certain type of real-world 'thing'