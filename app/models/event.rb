class Event < ActiveRecord::Base
  belongs_to :registeredapp
  
  validates :registeredapp, presence: true
  validates :name, presence: true
end
