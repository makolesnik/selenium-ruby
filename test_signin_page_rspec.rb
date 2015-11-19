require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
require 'csv'
require 'rspec'
require 'rspec/expectations'
require_relative 'helper.rb'
require_relative 'signin_page.rb'
require_relative 'internal_page.rb'

describe 'SignIn Page Test' do
  before(:all) do
    @helper = Helper.new
    @wait = @helper.wait
    @sp = @helper.signin_page
    @ip = @helper.internal_page
  end

  before(:each) do
    @sp.open
    begin
       @ip.logout
       @sp.open
     rescue
     end
  end

  after(:all) do
    @helper.quit
  end

  it 'Should signin with valid credentials' do
    @sp.signin('saga9119@gmail.com', 'Qwer12345')
    expect(@ip.internal_page?(@wait)).to be_truthy
  end

  it 'Should not signin with invalid credentials' do
    user_data.each do |user|
      email = user[0], password = user[1]
      @sp.signin(email, password)
      expect(@sp.signin_page?(@wait)).to be_truthy
    end
  end

  def user_data
    user_data = CSV.read Dir.pwd + '/user_data.csv'
    descriptor = user_data.shift
    descriptor = descriptor.map(&:to_sym)
    user_data.map { |user| Hash[descriptor.zip(user)] }
    user_data
    end
end
