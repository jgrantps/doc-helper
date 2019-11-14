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
    ["Gerald Mitchell Contracting"], #=> 1
    ["Mercers Best Built Structures"], #=> 2
    ["Grain Spaces"], #=> 3
    ["On The Level"], #=> 4
    ["Me And The Boys Contracting"], #=> 5
    ["JonesCo Contracting"], #=> 6
    ["Bowers Construction"], #=> 7
    ["Boris Developments"], #=> 8
    
  ],
  :users_company_keys =>
  ["user_id", "company_id"],
  :users_companies =>[
    [2,1],
    [3,1],
    [4,1],
    [5,3],
    [6,5],
    [7,6],
    [8,4],
    [14,7],
    [15,8],
    [16,6],

    [9,1],
    [9,2],
    [9,7],
    [10,8],
    [11,1],
    [11,3],
    [12,4],
    [12,5],
    [13,6],
    [13,8],
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
  make_users_companies
  make_accounts
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end

    new_user.save
  end
end

def make_companies
  DATA[:companies].each do |company|
    new_company = Company.new(:name => company)
    new_company.save
  end
end

def make_users_companies
  DATA[:users_companies].each do |user_company|
    new_user_company = UsersCompany.new
    user_company.each_with_index do |attribute, i|
      new_user_company.send(DATA[:users_company_keys][i]+"=", attribute)
    end

    new_user_company.save
  end
end

def make_accounts
  DATA[:accounts].each do |account|
    new_account = Account.new
    new_account.name = self[0]
    new_account.company_id = self[1]
    new_account.save
  end
end

def make_packages
  DATA[:packages].each do |package|
    new_package = Package.new
    package.each_with_index do |attribute, i|
      new_package.send(DATA[:package_keys][i]+"=", attribute)
    end

    new_package.save 
  end
end


main