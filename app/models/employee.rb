class Employee < ApplicationRecord
  belongs_to :department
  has_many :subodinates, class_name: 'Employee', foreign_key: "manager_id", inverse_of: :manager
  belongs_to :manager, class_name: 'Employee', inverse_of: :subodinates

  def as_json(options = {})
    {
      :name => self.first_name + ' ' + self.last_name,
     }
  end
  
end
