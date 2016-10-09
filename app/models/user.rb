class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan #associates user with plan
  attr_accessor :stripe_card_token #allows us to use hidden field data that we created and access with JS
  
  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token) #using stripe gem to send data to stripe server. to crete and charge a customer 
      self.stripe_customer_token = customer.id #set property for user and set it to the id that stripe returns need to add column in DB for this
      save!
    end
  end
end
