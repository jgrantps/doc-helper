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
  ],
  :company_keys =>
  ["name"],
  :companies =>[
    ["Gerald Mitchell Contracting"], #=> 
    ["Mercers Best Built Structures"], #=> 
    ["Grain Spaces"], #=> 
    ["On The Level"], #=> 
    ["Me And The Boys Contracting"], #=> 
    ["JonesCo Contracting"], #=> 
    ["Bowers Construction"], #=> 
    ["Boris Developments"], #=> 
    
  ],
  :account_keys =>


}

def main
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end

    new_user.save
  end
end
main
