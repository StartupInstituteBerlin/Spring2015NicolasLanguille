require 'rails_helper'

RSpec.describe Category, type: :model do

  it { expect(create :category ).to be_valid }

  context "attributes" do
    it "name is capitalized" do
      category = create :category, name: "itaLian"
      expect(category.name).to eq "Italian"
    end
  end
end
