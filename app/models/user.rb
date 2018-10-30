class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :reviews
  has_many :comments
  has_many :likes

  def self.search(search)
    if search
      where('full_name LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
