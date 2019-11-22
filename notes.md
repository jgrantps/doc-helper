user flow:

- step 1. User signs in through general sign in/sign up homepage

- step 2. Admin given dashboard ability to:
    * See all accounts
      * See all Packages
        * See all Documents
    * Create New accounts
    * Create New managers
    * Edit and remove accounts
    * Edit and remove managers.

- step 3. Manager can sign in and see dashboard with:
  * All assigned accounts and the corresponding children info.
  * Can create new contacts for assigned accounts
    * Can create/edit/delete packages for assigned accounts
    * Can create/delete documents for assigned packages

- step 4. Contacts can sign in and see dashboard with:
  * All assigned accounts
    * Can see all assigned packages
    * Can see/edit all assigned documents



To update the tailwind custom utilities config file:

1. run "bundle exec rails webpacker:clobber" in the command terminal
  #=> this will purge the "./public/packs" folders, which contain the updated info.
2. restart the server.
  #=> this will force webpacker to compile it's packs, including the updated config file.


TO DO LIST:

1. Complete the sign-in/signout pages with routing.

  NOTE --> 
    Sign-up form at views/home/index.html.erb is redundant.
    routing for sign-in now goes entirely through views/devise/sessions/new.html.erb
    Confirm that views/home/index.html.erb can be deleted.
    
    TEST AND CONFIRM BEFORE SUBMITTING FOR ASSESSMENT

2. complete the different role dashboard appearances.
2. complete company, account, package pages
  2.1 link the buttons for browsing functionality and associated routing
3. Complete the add/edit forms.
4. Complete the User permissions
5. complete the OmniAuth sign-in abilities.




forms notes:

