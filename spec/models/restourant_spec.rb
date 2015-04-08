require 'rails_helper'

RSpec.describe Restourant, type: :model do
  it { should belong_to :owner }
  it { is_expected.not_to belong_to :registered_user }
  it { is_expected.to belong_to :category }


  let!(:registered_user) { create :user, role_name: "registered" }
  let!(:owner) { create :user, role_name: "owner" }
  let!(:category) { create :category }

  context 'associations' do

  end


  it 'has a rate > 0'
  it 'has a rate < 6'

  it 'validates presence of :name'
  it 'validates presence of :address'
  it 'validates presence of :description'
  it 'validates presence of :phone'
  it 'accepts :logo as image'
end
