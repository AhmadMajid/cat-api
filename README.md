Basic API to manage Cats Collection. Has a Collections model that contains a cats model. (So you can have multiple collections of multiple cats).

Remember to rake db:seed to populate each with 1 item. Try rails db:drop db:create db:migrate db:seed if errors happen to occur (They shouldn't).

To do your CRUD operations (examples):

Find by name: 
first_cat = Cat.find_by(name: "...")

Update:
update: first_cat.update!(name: "new cat")

Find by id:
first_cat = Cat.find(id)

select first cat:
first_cat = Cat.first

Delete first cat:
first_cat.destroy

How to test code:

bundle exec rspec (the code is functional, a lot of errors were fixed via rspec but it's still showing things from earlier test messages. Am going to go back in and see if I can improve)




# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
