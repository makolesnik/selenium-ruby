require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
require 'csv'
require 'rspec'
require 'rspec/expectations'
require_relative 'helper.rb'
require_relative 'signinpage.rb'
require_relative 'internal_page.rb'


describe "SignIn Page Test" do


  before(:all) do  
	    @helper = Helper.new
	    @wait = @helper.wait
	    @sp = @helper.signin_page
	    @ip = @helper.internal_page
  end  
  
  after(:all) do  
    	@helper.quit
    	#assert_equal [], @verification_errors
  end  
      
  it "Should signin with valid credentials" do      
		@sp.open	
		@sp.signin('saga9119@gmail.com', 'Qwer12345')
		expect(@ip.is_internal_page(@wait)).to be_truthy
		@ip.logout
  end  

  it "Should not signin with invalid credentials" do      
		@sp.open	
		user_data.each do |user|
		  	email = user[0], password = user[1]		  
		  	@sp.signin(email, password)
			expect(@sp.is_signin_page(@wait)).to be_truthy		  
  		end  
  end


	def user_data
	  user_data = CSV.read Dir.pwd + '/user_data.csv'
	  descriptor = user_data.shift
	  descriptor = descriptor.map { |key| key.to_sym }
	  user_data.map { |user| Hash[ descriptor.zip(user) ] }
	  return user_data
    end

end  

