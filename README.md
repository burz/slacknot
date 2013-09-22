slacknot!
=========

slacknot! is an IDE for homework that keeps track of exactly how
long you spend on each problem in order to gain interesting
information about your study habits.

slacknot! was built during the 36-hour hackathon HopHacks.

Author: Anthony Burzillo

*****

In order to run you must have Ruby 2.0.0 installed as well as
rails 4.0. For PDF building, the server must have LaTeX
installed.

To run the first time:

```
rake db:create && rake db:migrate && bundle install && rails s
```

To run any other time:
```
rails s
```

The server will run at [http://localhost:3000](http://localhost:3000)

