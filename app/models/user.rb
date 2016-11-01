class User < ActiveRecord::Base
      devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
      validates :password, :presence => true, :confirmation => true, :on => :create   

      has_attached_file :avatar, styles: { medium: '152x152#' }  
      validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/        
      has_many :posts      
      has_many :comments
end
