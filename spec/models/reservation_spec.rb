require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let!(:owner) { create :user, role_name: "owner" }
  let!(:registered_user) { create :user, role_name: "registered" }
  let!(:restourant) { create :restourant, user_id: owner.id }


  it 'belongs_to :restourant' do
    reservation = create :reservation, restourant_id: restourant
    expect(reservation).to be_valid
  end

  it 'belongs_to :user as owner of :restourant' do
    reservation = create :reservation, user_id: owner.id
    expect(reservation).to be_valid
  end

  it 'validates presence of :last_name' do
    reservation = build :reservation, last_name: nil
    expect(reservation).not_to be_valid
  end

  it 'validates presence of :email' do
    reservation = build :reservation, email: nil
    expect(reservation).not_to be_valid
  end

  it 'validates presence of :no_people' do
    reservation = build :reservation, no_people: nil
    expect(reservation).not_to be_valid
  end

  it 'validates :no_people as numerically' do
    reservation = build :reservation, no_people: "whatever"
    expect( reservation ).not_to be_valid
  end

  it 'validates :no_people as only_integer' do
    reservation = build :reservation, no_people: 1.5
    expect( reservation ).not_to be_valid
  end

  it 'validates :no_people greater_than 0' do
    reservation = build :reservation, no_people: 0
    expect( reservation ).not_to be_valid
  end


  it 'validates :no_people less_than 15' do
    reservation = build :reservation, no_people: 16
    expect( reservation ).not_to be_valid
  end

  it 'validates presence of :datetime'

end
