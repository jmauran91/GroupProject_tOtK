## README

# Kensai Music DB

```
The Kensai Music DB application is a place for you, as an authorized user,
to add your favorite music releases to a database.  The database stores the
release title, the artist who created the work, the year of the release,
and the album cover art as well as a description and other optional information.  
Not only does it store this information, it also allows authorized users to
review each release and upvote or downvote it as well.  Don't like someone's
review of your favorite Winger release? Users can also leave a comment on any
particular review. Lastly, it allows a user to sort all the releases by genre
or search through the releases with the search bar.
```
## Check our App out on Heroku

WARNING: These work best on Google Chrome. Firefox revisions are underway.

* [Kensai Music DB](https://group-project-totk.herokuapp.com/)

This is an updated version, with functioning React components. GitHub Repo for this
available at: [Solo_Retry_Totk](https://github.com/jmauran91/solo_totk)

* [Kensai Music DB](https://group-project-totk2.herokuapp.com/)

#### Screenshot of the App


### Running locally
To run the application, please just clone the repo and run it like so:

```
git clone https://github.com/jmauran91/GroupProject_tOtK.git
cd GroupProject_tOtK
bundle install
npm install
then run in the console
$npm start
$rails s

```

#### Current features
* Signup and Sign in
* Show User profile with Avatar
* Add and List releases
* Add and List reviews of releases
* Show author profile info and reviews
* Add and Show comments to reviews
* Admin can Delete reviews

### TODOs
* Hookup our app to feed into twitter - for live notifications of updates to the Kensai Music DB


## Built With

* Ruby version 2.3.3
* [Devise](https://github.com/plataformatec/devise) - Used to authenticate users
* [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) - Used to
for its ability to upload a profile photo
* [React.js](https://facebook.github.io/react/) - Used to build a beautiful user
interface
* [Foundation-Rails](https://github.com/zurb/foundation-rails) - Used to add
Foundation to our Rails project


## Authors

Donathan Raymond - John Mauran - David Burt - Alexander Kalife

## License

This project is open source.
If you think you can improve on it, please do.

## Contributing

Please read
[CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426)
for details on our code of conduct, and the process for submitting pull
requests to us.



![Build Status](https://codeship.com/projects/193df370-0688-0135-1c2c-4ed15a318303/status?branch=master)
![Code Climate](https://codeclimate.com/github/jmauran91/GroupProject_tOtK.png)
![Coverage Status](https://coveralls.io/repos/jmauran91/GroupProject_tOtK/badge.png)
