# Rails Engine
[![Code Climate](https://codeclimate.com/github/weilandia/rails_engine/badges/gpa.svg)](https://codeclimate.com/github/weilandia/rails_engine) [![Build Status](https://travis-ci.org/weilandia/rails_engine.svg?branch=master)](https://travis-ci.org/weilandia/rails_engine) [![Coverage Status](https://coveralls.io/repos/github/weilandia/rails_engine/badge.svg?branch=add_multi_search_tests)](https://coveralls.io/github/weilandia/rails_engine?branch=add_multi_search_tests)

Rails Engine is a RoR API with a variety of endpoints for accessing Etsy merchant and customer data (dataset is local).  The business logic for the API is achieved using only ActiveRecord/SQL queries (no ruby).

To interact with the API, clone the repo and run ```rake db:setup``` and ```rake db:load_csv``` to populate the database.  The test suite is in RSpec and can be run with the command ```rake```.
