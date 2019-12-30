# The Doc-Helper

The Doc-Helper is a mock document-management platform designed for collaboration among groups of peers.  The general premise of its design is for business settings - ie: accounting firms handling multiple documents from multiple clients, with a variety of varying user roles and capabilities.

Users are added to the platform through invitaion from a user with administrator priveliges.  Users are assigned a Position in a Company, at which point they are able to create Accounts.  They are then able to create multiple Packages within their associated Accounts, and Package Comments assigned to each of their respective comments.

Once invited, users are able to sign in through their Twitter profile should they wish.

# Installation

To use this application locally, clone this repository onto your computer and run ```bundle ```. 

navigate to ```node_modules/tailwindcss/components.css``` and paste in the following styling to achieve highlighted error fields:

```
.field_with_errors input[type="text"] {
  @apply .border .bg-red-100 .border-red-500 .rounded;
}
```

run ```yarn install --check-files ``` ensure the javascript elements of the Tailwind css framework are up to dat.

run ```rake db:migrate```, followed by ```rake db:seed``` to take advantage of the seed data (recommended.)

run ```rails s``` to start your local server to run the application.

# Design

This application is designed (as a personal challenge to myself) to be near entirely template-driven.  This means that view file usages is reduced to partials or eliminated entirely.  Controllers define abstracted variables that drive a framework of helper methods which then serve either of two primary templates.  This approach streamlines the design and presentation of the data, significantly reducing size and complexity of the application's front-end.

# Usage

This application allows Users to submit data to different tiers within the application (ie packages, companies, etc...) and allows for a cross-reference of associated users to view and comment.  Users are able to review a dashboard of all their associated users as sorted by the associate's role and company positions.

ActiveRecord validations capture and provide feedback on any missing data from the user when new data is submitted.


## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Acknowledgements

This project was inspired by my good friend who happens to be a bookkeeper who was frustrated with her current document management solutions, created with the skills learned through the [flatironschool](http://flatironschool.com/), and submitted as my Rails Project.

## License

[MIT](https://choosealicense.com/licenses/mit/)