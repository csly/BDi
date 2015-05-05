class User < ActiveRecord::Base


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_tracks, dependent: :destroy
  has_many :tracks, through: :user_tracks


  def admin?
 admin
  end

  def client?
    client
  end

 
 
  
end

  