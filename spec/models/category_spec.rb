require 'rails_helper'

RSpec.describe Category, type: :model do

  it 'should has a valid Factory' do
    create(:category).should be_valid
  end
end
