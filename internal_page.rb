require 'page-object'

class InternalPage
	include PageObject

	button(:profile, :name => 'nav-item user-menu')
	button(:content, :xpath => './/*[contains(text(), " Content ")]') 

	def logout()
		@browser.get 'https://test-ruby.ghost.io/ghost/signout/'
	end

	def is_internal_page(wait)
		return true if wait.until { @browser.find_element(:class => 'global-nav') }
	end


end


