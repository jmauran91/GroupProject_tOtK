require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:username).when('testname', 'test_name') }
  it { should_not have_valid(:username).when('my..name', 123) }
end
