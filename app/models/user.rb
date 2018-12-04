class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :reviews
  has_many :comments
  has_many :likes
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  has_many :bookmarks, dependent: :destroy
  has_many :games, through: :bookmarks
  #has_attached_file :avatar

  scope :new_register, -> number {where("confirmed_at < ?", Time.current).limit(number)}

  def self.search(search)
    if search
      where('full_name LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
