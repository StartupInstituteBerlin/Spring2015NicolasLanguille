require 'rails_helper'

RSpec.describe Category, type: :model do

  it { expect(create :category ).to be_valid }

  end
end
