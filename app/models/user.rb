class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_tracks, dependent: :destroy
  has_many :tracks, through: :user_tracks
  has_many :production_company_users, dependent: :destroy
  has_many :production_companies, through: :production_company_users
  belongs_to :production_company

  def admin?
    admin
  end

  def client?
    client
  end
end
