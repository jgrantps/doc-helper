# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
  :user_keys => 
  ["name", "username", "email", "role", "password", "url"], 
  :users =>[
    ["Peter Grant", "jgrantps", "jgrantps@hotmail.com", "admin", "password111", "https://images.unsplash.com/photo-1550165703-3f6ae6887b9b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"], #=>1
    ["Jerry Mitchell", "JerryM", "jerry@gmhomes.com", "contact", "password111", "https://images.unsplash.com/photo-1558821078-8b2696bae783?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1226&q=80"], #=>2
    ["Jessesar Mitchell", "JessM", "jessesar@gmhomes.com", "contact", "password111", "https://images.unsplash.com/photo-1535745049887-3cd1c8aef237?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"], #=>3
    ["Angela Mitchell", "AngelaM", "angela@gmhomes.com", "contact", "password111", "https://images.unsplash.com/photo-1502178975179-8ed6e879c292?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"], #=>4
    ["Conrad Mullins", "ConradM", "conrad@grain.ca", "contact", "password111", "https://images.unsplash.com/photo-1536524293309-dec90390d9fd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"], #=>5
    ["Melvin Tibert", "MelvinT", "mel@meandtheboys.ca", "contact", "password111", "https://images.unsplash.com/photo-1550165298-844780aa1007?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80"], #=>6
    ["Mike Jones", "MikeJ", "mike@jonesco.ca", "contact", "password111", "https://images.unsplash.com/photo-1527272786992-a70c29447012?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=611&q=80"], #=>7
    ["Fiasal Forhart", "FiasalF", "fiasal@onthelevel.ca", "contact", "password111", "https://images.unsplash.com/photo-1553450011-54705ba130a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"], #=>8
    ["Traci Mathison", "TraciM", "traci@trinitywealth.com", "manager", "password111", "https://images.unsplash.com/photo-1555783239-cf4660ca21a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=632&q=80"], #=>9
    ["Nancy Reynolds", "NancyR", "nancy@trinitywealth.com", "manager", "password111", "https://images.unsplash.com/photo-1537071252776-5b88ccf778ed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"], #=>10
    ["David Lynn", "DavidL", "david@trinitywealth.com", "manager", "password111", "https://images.unsplash.com/photo-1534526080610-4be7aa1f8913?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"], #=>11
    ["Kim Fougere", "KimF", "kim@fougerebookkeeping.com", "manager", "password111", "https://images.unsplash.com/photo-1513688365525-03a864e341a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"], #=>12
    ["Dave Fougere", "DaveF", "Dave@fougerebookkeeping.com", "manager", "password111", "https://images.unsplash.com/photo-1493916665398-143bdeabe500?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80"], #=>13
    ["Caleb Bowers", "CalebB", "caleb@bowersconstruction.ca", "contact", "password111", "https://images.unsplash.com/photo-1447684808650-354ae64db5b8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1347&q=80"], #=>14
    ["Dean Hartman", "DeanH", "dean@borisdevelopments.ca", "contact", "password111", "https://images.unsplash.com/photo-1510993397587-b144e950b887?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"], #=>15
    ["Jeremy Mercer", "JeremyM", "jeremy@bestbuiltstructures.ca", "contact", "password111", "https://images.unsplash.com/photo-1542220365-4807048114ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"], #=>16
  ],
  
  :companies =>[
    "Gerald Mitchell Contracting", #=> 1
    "Mercers Best Built Structures", #=> 2
    "Grain Spaces", #=> 3
    "On The Level", #=> 4
    "Me And The Boys Contracting", #=> 5
    "JonesCo Contracting", #=> 6
    "Bowers Construction", #=> 7
    "Boris Developments", #=> 8
    
  ],
  :position_keys =>
  ["user_id", "company_id"],
  :positions =>[
    [2,1, "Owner"],
    [3,1, "Administration"],
    [4,1, "Administration"],
    [5,3, "Owner"],
    [6,5, "Owner"],
    [7,6, "Owner"],
    [8,4, "Owner"],
    [14,7, "Owner"],
    [15,8, "President"],
    [16,2, "Owner"],

    [9,1, "Lead Controller"],
    [9,2, "Accountant"],
    [9,7, "Lead Controller"],
    [10,8, "Bookkeeper"],
    [11,1, "Accountant"],
    [11,3, "Lead Controller"],
    [12,4, "Bookkeeper"],
    [12,5, "CFO"],
    [13,6, "Bookkeeper"],
    [13,8, "Lead Controller"],
  ],
  :account_keys =>
  ["name", "company_id"],
  :accounts =>[
    ["New Homes", 1], #=> 1
    ["Garages", 2], #=> 2
    ["Renovations", 2], #=> 3
    ["Roofing Jobs", 3], #=> 4
    ["Decks", 4], #=> 5
    ["Bathrooms", 4], #=> 6
    ["New Construction", 5], #=> 7
    ["Odd Jobs", 5], #=> 8
    ["Garages", 6], #=> 9
    ["Docks", 6], #=> 10
    ["New Construction", 7], #=> 11
    ["Land Development", 7], #=> 12
    ["Commercial Development", 8], #=> 13
    ["Residential Development", 8], #=> 14
  ]
}

def main
  make_users
  make_companies
  make_positions
  make_accounts
  
end

def make_users
    DATA[:users].each do |user|
    @user = User.invite!(:name => user[0], :username => user[1], :email => user[2], :role => user[3], :password => user[4], :url => user[5]) do |u|
      u.skip_invitation = true
    end
    
    token = Devise::VERSION >= "3.1.0" ? @user.instance_variable_get(:@raw_invitation_token) : @user.invitation_token
    User.accept_invitation!(:invitation_token => token, :password => user[4], :password_confirmation => user[4])

    puts "Created User #{user[0]} with password #{user[4]}"
    @user
  end
end






def make_companies
  DATA[:companies].each do |company|
    new_company = Company.new(:name => company)
    new_company.save
  end
end

def make_positions
  DATA[:positions].each do |position|
    relation = Position.new(user_id: position[0], company_id: position[1], title: position[2])
    relation.save
  end
end

def make_accounts
  DATA[:accounts].each do |account|
    new_account = Account.new
    new_account.name = account[0]
    new_account.company_id = account[1]
    new_account.save
  end
end



main