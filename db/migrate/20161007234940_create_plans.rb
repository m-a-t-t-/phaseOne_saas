class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name #string is the type of data/record name is the 'name of record'
      t.decimal :price #decimal is the type of data '' '' 
      
      t.timestamps
    end
  end
end
