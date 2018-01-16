require 'selenium-webdriver'

#define a webdriver to be used
chrome_driver = Selenium::WebDriver.for :chrome

chrome_driver.get('http://toolsqa.com/automation-practice-form/')

chrome_driver.find_element(:name, 'firstname').displayed?
chrome_driver.find_element(:name, 'firstname').send_keys('Richard')
chrome_driver.find_element(:name, 'lastname').displayed?
chrome_driver.find_element(:name, 'lastname').send_keys('Gurney')

sleep 3
