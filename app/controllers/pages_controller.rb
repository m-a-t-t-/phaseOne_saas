class PagesController < ApplicationController
    def home
        @basic_plan = Plan.find(1) #instance vars communicating with Plan DB table #active record methods
        @pro_plan = Plan.find(2) # find method is 'plucking out' DB plan table with id of 2
    end
    
    def about
    end
end
