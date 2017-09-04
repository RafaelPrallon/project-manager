class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :user_projects
  has_many :comments
  has_many :projects, through: :user_projects

  extend FriendlyId
  friendly_id :full_name, use: [:slugged]

  def full_name
    return "#{first_name} #{last_name}".titleize if (first_name || last_name)
    "Anon"
  end
  
  def self.search(param)
    return User.none if param.blank?
    param.strip!
    param.downcase!
    (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
  end

  def self.first_name_matches(param)
    matches('first_name', param)
  end

  def self.last_name_matches(param)
    matches('last_name', param)
  end

  def self.email_matches(param)
    matches('email', param)
  end

  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end
end
