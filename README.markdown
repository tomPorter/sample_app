# Welcome to Rails #

This is Tom's master branch of the R3T sample app.

## Notes: ##

* Created pages controller using:

		rails generate controller Pages home contact

* Followed R3T suggestion to remove spec subdirs and concentrate on spec/controllers:
		 
		git rm -r spec/views/
	  git rm -r spec/helpers/

* spork/autotest does not always pick up changes, specifically did not pickup 
  changes to application.html.erb.
* Had to add webrat to Gemfile for RSpec 2.50 to use have\_selector in spec example.
* In order for spec/controllers/pages\_controller\_spec.rb to see inside rendered HTML
  (due to not having spec/views tests) had to add:
		render\_views

## Pushed to heroku with: ##
		
		git push heroku rspec_250:master
		
Full gem list installed in my gemset:

* abstract (1.0.0)
* actionmailer (3.0.3)
* actionpack (3.0.3)
* activemodel (3.0.3)
* activerecord (3.0.3)
* activeresource (3.0.3)
* activesupport (3.0.3)
* arel (2.0.7, 2.0.6)
* autotest-fsevent (0.2.4)
* autotest-growl (0.2.9)
* autotest-rails-pure (4.1.2)
* autotest-standalone (4.5.5)
* builder (2.1.2)
* bundler (1.0.10, 1.0.7)
* configuration (1.2.0)
* diff-lcs (1.1.2)
* erubis (2.6.6)
* heroku (1.17.10)
* hirb (0.3.6)
* i18n (0.5.0)
* json (1.4.6)
* launchy (0.3.7)
* mail (2.2.15, 2.2.13)
* mime-types (1.16)
* polyglot (0.3.1)
* rack (1.2.1)
* rack-mount (0.6.13)
* rack-test (0.5.7, 0.5.6)
* rails (3.0.3)
* railties (3.0.3)
* rake (0.8.7)
* rdoc (3.2, 2.5.11)
* rest-client (1.6.1)
* rspec (2.5.0, 2.0.0)
* rspec-core (2.5.1, 2.0.0)
* rspec-expectations (2.5.0, 2.0.0)
* rspec-mocks (2.5.0, 2.0.0)
* rspec-rails (2.5.0, 2.0.0)
* spork (0.8.4)
* sqlite3-ruby (1.3.2, 1.2.5)
* sys-uname (0.8.5)
* thor (0.14.6)
* treetop (1.4.9)
* tzinfo (0.3.24, 0.3.23)
* wirble (0.1.3)