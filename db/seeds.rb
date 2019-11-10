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
    ["Peter Grant", "jgrantps", "jgrantps@hotmail.com", "admin", "password111"]
  ]
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
