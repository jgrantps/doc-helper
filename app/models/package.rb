class Package < ApplicationRecord
  has_many :documents
  has_many :package_comments
  belongs_to :account 
  has_many :positions, through: :company
  has_many :users, through: :positions

  enum status: [:backlog, :in_progress, :ready_for_review, :complete]
  
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
  
  def backlog
    self.select {|package| package.status == "backlog"}
  end
  
  def in_progress
    self.select {|package| package.status == "in_progress"}
  end
  
  def ready_for_review
    self.select {|package| package.status == "ready_for_review"}
  end
  
  def complete
    self.select {|package| package.status == "complete"}
  end

  

  
end
