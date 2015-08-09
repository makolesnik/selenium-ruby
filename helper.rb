require 'page-object'
require 'rubygems'
require 'selenium-webdriver'

class Helper
  	
  	def initialize
		chromedriver_path = File.join(File.absolute_path(File.dirname(__FILE__)), 
														'browsers','chromedriver')
	    Selenium::WebDriver::Chrome.driver_path = chromedriver_path
	    @wait = Selenium::WebDriver::Wait.new(:timeout => 2)
	   	@driver = Selenium::WebDriver.for :chrome 	  
    end

    def wait
        return @wait
    end

    def quit
    	@driver.quit()
    end

    def signin_page
        return SigninPage.new(@driver)       
    end

    def internal_page
        return InternalPage.new(@driver)       
    end   

end
