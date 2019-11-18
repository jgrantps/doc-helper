# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
  :user_keys => 
  ["name", "username", "email", "role", "password"], 
  :users =>[
    ["Peter Grant", "jgrantps", "jgrantps@hotmail.com", "admin", "password111"], #=>1
    ["Jerry Mitchell", "JerryM", "jerry@gmhomes.com", "contact", "password111"], #=>2
    ["Jessesar Mitchell", "JessM", "jessesar@gmhomes.com", "contact", "password111"], #=>3
    ["Angela Mitchell", "AngelaM", "angela@gmhomes.com", "contact", "password111"], #=>4
    ["Conrad Mullins", "ConradM", "conrad@grain.ca", "contact", "password111"], #=>5
    ["Melvin Tibert", "MelvinT", "mel@meandtheboys.ca", "contact", "password111"], #=>6
    ["Mike Jones", "MikeJ", "mike@jonesco.ca", "contact", "password111"], #=>7
    ["Fiasal Forhart", "FiasalF", "fiasal@onthelevel.ca", "contact", "password111"], #=>8
    ["Traci Mathison", "TraciM", "traci@trinitywealth.com", "manager", "password111"], #=>9
    ["Nancy Reynolds", "NancyR", "nancy@trinitywealth.com", "manager", "password111"], #=>10
    ["David Lynn", "DavidL", "david@trinitywealth.com", "manager", "password111"], #=>11
    ["Kim Fougere", "KimF", "kim@fougerebookkeeping.com", "manager", "password111"], #=>12
    ["Dave Fougere", "DaveF", "Dave@fougerebookkeeping.com", "manager", "password111"], #=>13
    ["Caleb Bowers", "CalebB", "caleb@bowersconstruction.ca", "contact", "password111"], #=>14
    ["Dean Hartman", "DeanH", "dean@borisdevelopments.ca", "contact", "password111"], #=>15
    ["Jeremy Mercer", "JeremyM", "jeremy@bestbuiltstructures.ca", "contact", "password111"], #=>16
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
  ],
  :package_keys =>
  ["name", "account_id", "importance", "complete", "due_date"],
  :packages =>[
    ["2018 year-end", 1, 4, false, ""], #=>
    ["2019 Q1", 1, 2, false, ""], #=>
    ["2018 Payroll breakdown", 1, 1, false, ""], #=>
    ["2018 Cost Sheet", 2, 4, false, ""], #=>
    ["2019 Q1", 3, 1, false, ""], #=>
    ["2018 Q4 Labor costs", 4, 4, false, ""], #=>
    ["2019 Q1 Material costs", 5, 4, false, ""], #=>
    ["2019 Q2 Supplier Pricing", 6, 1, false, ""], #=>
    ["2019 Q2 Time Sheets", 6, 2, false, ""], #=>
    ["2019 Payroll Breakdown YTD", 7, 5, false, ""], #=>
    ["2019 Material Costs YTD", 8, 1, false, ""], #=>
    ["2019 Payroll Breakdown YTD", 8, 3, false, ""], #=>
    ["2018 Material Costs", 9, 4, false, ""], #=>
    ["2018 Material Costs", 9, 4, false, ""], #=>
    ["2018 Material Costs", 10, 3, false, ""], #=>
    ["2018 Sales Report", 10, 4, false, ""], #=>
    ["2018 Sales Report", 11, 5, false, ""], #=>
    ["2018 Tax Report", 11, 1, false, ""], #=>
    ["2018 Payroll Breakdown", 11, 5, false, ""], #=>
    ["2019 Tax Report (estimated)", 12, 5, false, ""], #=>
    ["2019 Lease Report - YTD", 13, 4, false, ""], #=>
    ["2019 Overhead - YTD", 13, 2, false, ""], #=>
    ["2019 Overhead - YTD", 13, 2, false, ""], #=>
    ["2018 Rental Revenue", 14, 4, false, ""], #=>
    ["2018 Overhead", 14, 2, false, ""], #=>
        
  ]
}

def main
  make_users
  make_companies
  make_positions
  make_accounts
  make_packages
end

def make_users
    DATA[:users].each do |user|
    @user = User.invite!(:name => user[0], :username => user[1], :email => user[2], :role => user[3], :password => user[4]) do |u|
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

def make_packages
  DATA[:packages].each do |package|
   bob = Package.new(name: package[0], account_id: package[1], importance: package[2], complete: package[3], due_date: package[4])
    bob.save 
  end
end


main