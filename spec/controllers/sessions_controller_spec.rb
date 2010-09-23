require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be successful" do
      post 'create'
      response.should be_success
    end
    
    describe "invalid login" do
      
      before(:each) do
        @attributes = { :email => "charliegodsoe@gmail.com", :password => "not it" }
      end
      
      it "should return to the sign in page" do
        
        post :create, :session => @attributes
        response.should render_template('new')
      end
      
      it "should use a flash.now message to indicate a failure" do
        
        post :create, :session => @attributes
        flash.now[:error].should =~ /invalid/i
      end
    end
    
    describe "with valid login" do
      
      before(:each) do
        @user = Factory(:user)
        @attributes = { :email => @user.email, :name => @user.name }
      end
      
      it "should sign the user in" do
        post :create, :session => @attributes
        controller.signed_in_user.should == @attributes
        controller.should be_signed_in #equivalent to controller.signed_in?.should be_true        
      end
      
      it "should redirect to the user page" do
        post :create, :session => @attributes
        response.should redirect_to(user_path(@user))
      end
    end
  end

  describe "DELETE 'destroy'" do
    it "should be successful" do
      delete 'destroy'
      response.should be_success
    end
    
    it "should sign a user out" do
      test_sign_in(Factory(:user))
      delete :destroy
      controller.should_not be_signed_in
      response.should redirect_to(root_path)
    end
  end
end
