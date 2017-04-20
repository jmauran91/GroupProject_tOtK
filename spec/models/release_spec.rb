require 'rails_helper'
RSpec.describe Release, type: :model do

  it { should have_valid(:title).when('testname', 'test_name') }

  it { should have_valid(:artist).when('testname', 'test_name') }

  it { should have_valid(:year).when(1986, 7776) }
  it { should_not have_valid(:year).when('dobblit') }

  it { should have_valid(:no_of_tracks).when(9) }
  it { should_not have_valid(:no_of_tracks).when('many_tracks') }

  it { should have_valid(:album_art_url).when('https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Beethoven.jpg/1200px-Beethoven.jpg', 'http://pngimg.com/uploads/doctor/doctor_PNG16004.png') }
  it { should_not have_valid(:album_art_url).when('my_name', 123) }

end
