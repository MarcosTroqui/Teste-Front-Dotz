# frozen_string_literal: true

require 'capybara'
require 'capybara/dsl'
require 'cucumber'
require 'pry'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'page_helper.rb'

case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "headless"
  @driver = :selenium_chrome_headless
else
  puts "Invalid Browser"
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = 'https://submarino.com.br'
  config.default_max_wait_time = 20
  Capybara.page.driver.browser.manage.window.maximize
end
World(Capybara::DSL)
World(Pages)
