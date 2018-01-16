require 'selenium-webdriver'

class SeleniumQaToolsForm

  PRACTICE_FORM_URL = 'http://toolsqa.com/automation-practice-form/'
  FIRST_NAME_FIELD_NAME = 'firstname'
  LAST_NAME_FIELD_NAME = 'lastname'
  # SEX_MALE_FIELD_NAME = 'sex-0'
  SEX_FEMALE_FIELD_NAME = 'sex-1'
  YEARS_EXPERIENCE_FIELD_NAME = 'exp-1'
  DATE_FIELD_NAME = 'datepicker'
  PROFESSION_FIELD_NAME = 'profession-1'
  AUTOMATION_TOOL_FIELD_NAME = 'tool-2'
  CONTINENTS_FIELD_NAME = 'continents'
  SELENIUM_COMMANDS_FIELD_NAME = 'selenium_commands'
  BUTTON_ACTION = 'submit'

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def visit_practice_form
    @chrome_driver.get(PRACTICE_FORM_URL)
  end

  def first_name(text)
    @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME).send_keys(text)
  end

  def last_name(text)
    @chrome_driver.find_element(:name, LAST_NAME_FIELD_NAME).send_keys(text)
  end

  # def sex_male
  #   @chrome_driver.find_element(:id, SEX_MALE_FIELD_NAME).selected?
  #   @chrome_driver.find_element(:id, SEX_MALE_FIELD_NAME).click
  # end

  def sex_female
    @chrome_driver.find_element(:id, SEX_FEMALE_FIELD_NAME).selected?
    @chrome_driver.find_element(:id, SEX_FEMALE_FIELD_NAME).click
  end

  def years_experience
    @chrome_driver.find_element(:id, YEARS_EXPERIENCE_FIELD_NAME).selected?
    @chrome_driver.find_element(:id, YEARS_EXPERIENCE_FIELD_NAME).click

    # or
    # random_value = rand(0...6)
    # @chrome_driver.find_element(:id, "exp-#{random_value}").click
  end

  def date_picker(date)
    @chrome_driver.find_element(:id, DATE_FIELD_NAME).send_keys(date)
  end

  def profession
    @chrome_driver.find_element(:id, PROFESSION_FIELD_NAME).click
  end

  def automation_tool
    @chrome_driver.find_element(:id, AUTOMATION_TOOL_FIELD_NAME).click
  end

  def continents
    continents = @chrome_driver.find_element(:id, CONTINENTS_FIELD_NAME)
    select = continents.find_element(:id, CONTINENTS_FIELD_NAME)
    all_options = select.find_elements(:tag_name => 'option')
    all_options.each {|option| if option.text == "Africa"; option.click end}
  end

  def selenium_commands
    commands = @chrome_driver.find_element(:id, SELENIUM_COMMANDS_FIELD_NAME)
    select = commands.find_element(:id, SELENIUM_COMMANDS_FIELD_NAME)
    all_options = select.find_elements(:tag_name => 'option')
    all_options.each {|option| if option.text == "Switch Commands"; option.click end}
  end

  def get_first_name_field
    puts @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME)['value']
  end

  def submit_button
    @chrome_driver.find_element(:id, BUTTON_ACTION).click
  end

end

practice_form_page = SeleniumQaToolsForm.new
practice_form_page.visit_practice_form
practice_form_page.first_name('Richard')
practice_form_page.last_name('Gurney')
practice_form_page.sex_female
sleep 2
practice_form_page.date_picker('12-11-2017')
sleep 2

practice_form_page.profession
sleep 2

practice_form_page.automation_tool
sleep 2

practice_form_page.continents
sleep 2

practice_form_page.submit_button
