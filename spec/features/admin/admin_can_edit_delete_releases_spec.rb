require 'rails_helper'

feature 'Admin can update/delete user posts and accounts' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user_2) { FactoryGirl.create(:user, role: 'admin') }
  let!(:release) { FactoryGirl.create(:release, user_id: 1) }
  let!(:review) { FactoryGirl.create(:review, release_id: 1, user_id: 1) }
  let!(:review) { FactoryGirl.create(:comment, review_id: 1, user_id: 1) }


  xscenario 'Admin deletes comment' do

  end



end
