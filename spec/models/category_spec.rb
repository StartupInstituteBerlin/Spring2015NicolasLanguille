require 'rails_helper'

RSpec.describe Category, type: :model do

  context 'attributes' do
    it 'name is well formatted' do
      category = create :category, name: "itaLian"
      expect( category.name ).to eq "Italian"
    end
  end

  context 'about validations' do
    it 'is invalid without a name' do
      category = build :category, name: nil
      expect( category ).not_to be_valid
    end

    it 'has a unique name' do
      create :category, name: "Italian"
      category = build :category, name: "Italian"
      expect( category ).not_to be_valid
    end

    # include_examples :is_unique, Category, :param, :string
  end
end
