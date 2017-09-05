class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects

  extend FriendlyId
  friendly_id :name, use: :slugged

  def leader
    return self.users.first
  end

  def self.search(param)
    return Project.none if param.blank?

    param.strip!
    param.downcase!
    (name_matches(param) + users_matches(param) + leader_matches(param)).uniq
  end
  
  def self.name_matches(param)
    matches('full_name', param)
  end
  
  def self.users_matches(param)
    matches('users', param)
  end
  
  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end
end
