# Welcome to Rails #

This is Tom's master branch of the R3T sample app.

## Notes: ##

* _ToDo:_ Look into rails3-generators gem, along with haml-rails and jquery-rails gems for alternate
	generators for shoulda, factory girl, haml, and jquery.

* Basic additional column migration:

		rails generate migration add_foo_to_model column:type

* Lesson 6 at 1:14:05 discusses creation of two Users in memory failing uniqueness validation
	on email because not saved to DB yet, and tries to solve the problem by using an index on
	email address??!!  See R3T book on his details.  R3 rdoc on `validates_uniqueness_of` method
 	_does_ document existence of race conditions in AR ORM.  Not so good.  

  Worse is that
  if you create unique index, this will prevent dupe keys, but AR throws a general
	ActiveRecord::StatementInvalid exception that you will have to differentiate from other
	types of errors by parsing the DB-specific exception message to figure this out and ask the
	user to redo the operation. "You have entered an email address that belongs to someone else,
  please try again."

	**UPDATE: Actually R3 docs for** `validates_uniqueness_of` **are not current:  R3 throws an 
	ActiveRecord::RecordNotUnique 
	exception if DB uniqueness constraints are violated.**

* foo! methods in Rails generally mean that method will throw error if there are 
	problems, as opposed to interpreting as being a method that modifies calling object.
	Model.create model.create! - create! throws error if model fails validation, while create will fail
	silently, not creating the instance in the DB, and returning an instance with nil id (which shows 
	this occurred), but no real failure.

* Varied from tutorial by using email validation with a custom validation in
	app/validators.  See app/validators/email\_validator.rb  from [http://my.rails-royce.org/2010/07/21/email-validation-in-ruby-on-rails-without-regexp/](http://my.rails-royce.org/2010/07/21/email-validation-in-ruby-on-rails-without-regexp/)

* Added annotate-models to Gemfile

	rails console --sandbox insulates DB from permanent changes

* Deployed at [afternoon-spring-183.heroku.com](http://afternoon-spring-183.heroku.com)

* __NOTE__ last test in LayoutLinks spec does NOT stay on home page, but does follow each
  link as it is clicked, so only reason all these links can be tested in one test is that the
  occur on all pages.  That's why the 'Sign up now!' link had to be pressed first, since it
  is only on the home page.

* Created pages controller using:

		rails generate controller Pages home contact

* Followed R3T suggestion to remove spec subdirs and concentrate on spec/controllers:
		 
		git rm -r spec/views/
		git rm -r spec/helpers/

* spork/autotest does not always pick up changes, specifically did not pickup 
  changes to application.html.erb. 

	_Depends on spork setup in spec\_helper.rb_

* Had to add webrat to Gemfile for RSpec 2.50 to use have\_selector in spec example.
* In order for spec/controllers/pages\_controller\_spec.rb to see inside rendered HTML
  (due to not having spec/views tests) had to add:

		render_views

*	To see differences between local branch and remote branch, have to use fetch.  `git fetch` is 
  different from `git pull` in that `git pull` merges changes with local branch, while `git fetch` 
	updates the index with entries for `origin/master`???

		git fetch
		git diff master origin/master | mate

*	ruby\_fu:

		%w(a b c).map(&:upcase)       #same as
		%w(a b c).map {|x| x.upcase}
		
	dissected: means calling `to_proc` *&* on the *symbol* `upcase`. This returns an anonymous *Proc*
  object that responds to the method named by the *symbol*.  This may be a ruby 1.9.2 thing
 	inherited from RoR.

*	More understanding!  You can pass hash elements to a method if they are the last parameters
	in the parameter list. Hence:

		>>def f(x,h)
		>?  puts x.inspect
		>?  puts h.inspect
		>?end
		=> nil
		>>f 'foo', :time => 3,:door => 'ajar'
		"foo"
		{:time=>3, :door=>"ajar"}
		=> nil

*	Start of CSS basics:

	*	_foo_ {} indicates styling for a tag named _foo_
	*	_foo_ _bar_ {} indicates styling for the _bar_ tag nested inside a _foo_ tag
	*	_foo_:_action_ {} indicates styling for the _foo_ tag when _action_ takes place, like __hover__ or __click__
	*	_foo_._stuff_ {} indicates styling for the _foo_ tag with a class named _stuff_
			
			<foo class="stuff">This is CSS!</foo>

	*	._stuff_ {} indicates styling for **any** tag with class named _stuff_
	*	**Serious** mangling of list items, this converts a normal vertical item list into a horizontal one (The `display: inline-block` does this):
			
			nav ul {
			  margin: 0;
			  padding: 0;
			}

			nav li {
			  list-style-type: none;
			  display: inline-block;
			  padding: 0.2em 0;
			}

* Partials are the **bomb**!  Similar to Hobo _DRYml_ and tag creation.

* I have a bit of confusion over differences between request specs and controller specs, particularly
	when my pages\_controller\_spec.rb has a render\_views method to pul in page content.  Difficult to 
	make spork reload when changing routes, have to run autotest bare to test them.  I installed 	
	'guard-rails' to try to solve this, but not much help.

* When originally in rspec\_250 branch Pushed to heroku with:
		
		git push heroku rspec_250:master

*	Lesson 4: Introduces Blueprint CSS framework.  (May need to look at how this relates to Compass, I think hey are pretty different)
		
## Full gem list installed in my gemset: ##

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
