require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
require 'csv'
require_relative 'helper.rb'
require_relative 'signinpage.rb'
require_relative 'internal_page.rb'


class SigninPageTest < Test::Unit::TestCase 

	def setup
	    @helper = Helper.new
	    @wait = @helper.wait
	    @sp = @helper.signin_page
	    @ip = @helper.internal_page
	    @verification_errors = []

	end


	def test_signin_with_valid_credentials
		@sp.open	
		@sp.signin('saga9119@gmail.com', 'Qwer12345')
		assert(@ip.is_internal_page(@wait))
	end

	def test_signin_with_invalid_credentials
		@sp.open	
		user_data.each do |user|
		  	email = user[0], password = user[1]		  
		  	@sp.signin(email, password)
			assert(@sp.is_signin_page(@wait))		  
		end
	end

	def user_data
	  user_data = CSV.read Dir.pwd + '/user_data.csv'
	  descriptor = user_data.shift
	  descriptor = descriptor.map { |key| key.to_sym }
	  user_data.map { |user| Hash[ descriptor.zip(user) ] }
	  return user_data
    end


    def teardown    	
    	@helper.quit
    	assert_equal [], @verification_errors
    end


    def verify(&blk)
        yield
        rescue Test::Unit::AssertionFailedError => ex
        @verification_errors << ex
    end
end