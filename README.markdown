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