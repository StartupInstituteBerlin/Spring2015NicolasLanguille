require 'rails_helper'

RSpec.describe Rating, type: :model do
  let!(:registered_user) { create :user, role_name: "registered" }
  let!(:owner) { create :user, role_name: "owner" }
  let!(:restourant) { create :restourant, user_id: owner }

  it "belongs_to a registered user and a restourant" do
    rate = build :rating, restourant_id: restourant.id, user_id: registered_user.id

    expect( rate ).to be_valid
  end

  it "does not belong to an owner user" do
    rate = build :rating, user_id: owner.id, restourant_id: restourant.id
    expect( rate ).not_to be_valid
  end

  it "validates presence of :user_id" do
    rate = build :rating, user_id: nil, restourant_id: restourant.id
    expect( rate ).not_to be_valid
  end

  it "validates presence of :restourant_id" do
    rate = build :rating, user_id: registered_user.id, restourant_id: nil
    expect( rate ).not_to be_valid
  end

  it "validates presence of :value" do
    rate = build( :rating, user_id: registered_user.id,
                           restourant_id: restourant.id,
                           value: nil)
    expect( rate ).not_to be_valid
  end

end
