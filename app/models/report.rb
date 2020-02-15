
   class Report < ActiveRecord::Base
    
    validates :date, :due_date, :comment, :subjects,  presence: true
    
    belongs_to :user

 
   end