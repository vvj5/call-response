CALL RESPONSE HOMEWORK PROJECT

* Given the request GET http://localhost:3000/users HTTP/1.1
  you will see ALL the users from the database printed with an appropriate response code.

* Given the request GET http://localhost:3000/users/1 HTTP/1.1
  you will see ONLY the user from the database with that id.

*** NOT FUNCTIONAL *** Given the request GET http://localhost:3000/users/9999999 HTTP/1.1
  I should see a message saying it was not found and the appropriate response code returned to me.



## Rundown

```
├── Gemfile                               # Details which gems are required by the project
├── Gemfile.lock
├── README.md                             # This file
├── Rakefile                              # Defines `rake generate:migration` and `db:migrate`
├── bin
│   └── run.rb                            # `ruby bin/run.rb` will start the program.
├── config
│   └── database.yml                      # Defines the database config (e.g. name of file)
├── console.rb                            # `ruby console.rb` starts `pry` with models loaded
├── db
│   ├── dev.sqlite3                       # Default location of the database file
│   ├── migrate                           # Folder containing generated migrations
│   │   └── 20150601153856_add_user.rb    # My created migration file
│   └── setup.rb                          # `require`ing this file sets up the db connection
└── lib                                   # Ruby code (models, etc.) should go here
    ├── all.rb                            # Require this file to auto-require _all_ `.rb` files in `lib`
    └── user.rb                           # My Ruby coded User table file
```
