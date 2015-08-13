require 'page-object'



class SigninPage
	include PageObject

	text_field(:email_field, :name => 'identification')
	text_field(:password_field, :name => 'password')
	button(:login, :css => 'button[type="submit"]')
 
	def signin(email, password)
		self.email_field = email
		self.password_field = password
		login
		return InternalPage.new(@browser)  			 
	end

	def signin_as(user)
		self.email_field = user.email
		self.password_field = user.password
		login
		return InternalPage.new(@browser)  			 
	end

	def open()
		@browser.get 'https://test-ruby.ghost.io/ghost/signin/'
	end



	def is_signin_page(wait)
		return true if wait.until { @browser.find_element(:name => 'identification') }
	end


end


