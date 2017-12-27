class Registeredapp < ActiveRecord::Base
    before_create :owner
    belongs_to :user
    has_many :events
  
    scope :visible_to, -> (owner) { owner ? all : "you don't have any registered apps" }
    
    validates :name, length: { minimum: 2 }, presence: true
    validates :url, uniqueness: true, presence: true
    validates :user, presence: true 
    
    def owner
        self.user_id = user.id
    end
end
