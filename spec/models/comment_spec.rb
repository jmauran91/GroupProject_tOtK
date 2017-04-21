require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should have_valid(:body).when('testname', 'test_name') }
  it { should_not have_valid(:body).when(nil, "") }
end
