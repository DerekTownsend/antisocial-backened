This project serves as the backend API for my frontend antisocial app.

To run this project:
  You must first have the postgres app and bundler
 # bundle install
 # rails db:create
 # rails db:migrate
 # rails db:seed
 # rails s 
 To run it locally you must change the origin in the /config/initializers/cors.rb to a '*' instead of 'antisocial202.herokuapp.com'
 Once you run the server  go to http://localhost:3000/trending to see the json format.
