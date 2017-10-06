class User < ActiveRecord::Base
  has_many :registeredapps, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :registerable,
         :recoverable, :trackable, :validatable, :confirmable
  
  



  
  
  validates :email,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }           

  #def primary_email
  #email.primary || (email.first if new_record?)
  #end  
  
  def create
  end
  
   
   def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
   end
end
