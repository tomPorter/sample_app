require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    it "should have the right title" do
      get 'new'
      response.should have_selector('title', :content => "#{@base_title} | SignUp")
    end
    it "should have non-blank  body" do
      get 'new'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end

end
