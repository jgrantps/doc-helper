class Package < ApplicationRecord
  has_many :package_comments
  belongs_to :account 
  
  enum status: [:backlog, :in_progress, :ready_for_review, :complete]
  validates :name, presence: true
  
  scope :specific, -> (name) {where(id: name.packages)}

  def company 
   self.account.company 
  end
  
  def title 
    titles = company.positions.map {|position| position.title }
    titles.uniq
  end

  def users 
    company.users 
  end

  def self.status    
    self.statuses.keys 
  end  
 
end
