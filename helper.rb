require 'rubygems'
require 'page-object'
require 'selenium-webdriver'

class Helper
  def initialize
    chromedriver_path = File.join(File.absolute_path(File.dirname(__FILE__)), 'browsers', 'chromedriver')
    Selenium::WebDriver::Chrome.driver_path = chromedriver_path
    @wait = Selenium::WebDriver::Wait.new(timeout: 2)
    @driver = Selenium::WebDriver.for :chrome
   end

  attr_reader :wait

  def quit
    @driver.quit
  end

  def signin_page
    SigninPage.new(@driver)
  end

  def internal_page
    InternalPage.new(@driver)
  end
end
