require 'spec_helper'
## Tests routes

describe "LayoutLinks" do
  
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end
  
  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  
  it "should a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end

  it "should a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "SignUp")
  end
  
  it "should have correct links on home page" do
    visit root_path
    response.should have_selector('title',:content => "Home" )
    ## >> NOTE: once the following click_link occurs, the
    ##    test has moved to that page!!!
    click_link "Sign up now!"
    response.should have_selector('title',:content => "SignUp" )
    click_link "Home"
    response.should have_selector('title',:content => "Home" )
    click_link "Help"
    response.should have_selector('title',:content => "Help" )
    #click_link "Sign in"
    #response.should have_selector('title',:content => "Signin" )
    click_link "About"
    response.should have_selector('title',:content => "About" )
    click_link "Contact"
    response.should have_selector('title',:content => "Contact" )
    #click_link "News"
    #response.should have_selector('title',:content => "Rails Tutorial News" )
    #click_link "Rails Tutorial"
    #response.should have_selector('title',:content => "Learn Rails by Example" )    
  end
end