require 'mri/spec_helper'

RSpec.describe 'browser formatter', type: :feature do
  before { Capybara.app = Rack::Builder.new_from_string(File.read("#{__dir__}/../../../config.ru")) }

  before do
    visit '/'
    # Specs should run in 12 seconds but in case Travis takes longer, provide some cushion
    Capybara.default_max_wait_time = 40
  end

  after do
    js_errors = page.evaluate_script('window.jsErrors')
    puts "Javascript errors: #{js_errors}" if js_errors.any?
  end

  it 'matches test results' do
    expect(page.find('h1')).to have_content 'RSpec Code Examples'
    expect(page.find('#totals')).to have_content '142 examples, 40 failures, 12 pending'
  end
end
