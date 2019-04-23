require 'rails_helper'

RSpec.describe 'Authentication', type: :system do

  scenario 'Login', authenticated: false do
    login(
      username: 'master@example.com',
      password: 'test',
    )

    expect_current_route 'dashboard'
  end

  scenario 'Logout' do
    logout
    expect_current_route 'login', wait: 2
  end
end
