# selenium-ruby
Simple selenium tests with ruby.
Test object: Ghost is an open source publishing platform (https://ghost.org/)


# How to get started:

meet all requirements

$ git clone https://github.com/mkpythonanywhereblog/selenium-ruby.git

$ cd selenium-ruby

$ bundle install

run the test with rspec, Chrome browser is started by default:

$ rspec test_signin_page_rspec.rb

generate test results report in html format:

$ rspec test_signin_page_rspec.rb --format html --out test_results.html

In case of any load errors please check your gems version and dependencies.

