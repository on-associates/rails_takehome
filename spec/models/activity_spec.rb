require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:activity) { FactoryBot.build(:activity) }
  subject { activity }

  it "should not save when it has no name" do
    activity.name = ""

    expect(activity).to_not be_valid
  end

  it "saves that has a name" do
    expect(activity).to be_valid
  end

  it "should not save when it has no address" do
    activity.address = ''

    expect(activity).to_not be_valid
  end

  it "saves that has an address" do
    expect(activity).to be_valid
  end

  it "should not save when it has no start at date" do
    activity.starts_at = nil

    expect(activity).to_not be_valid
  end

  it "saves that has start at date" do
    expect(activity).to be_valid
  end

  it "should not save when it has no end at date" do
    activity.ends_at = nil

    expect(activity).to_not be_valid
  end

  it "should save that has end at date" do
    expect(activity).to be_valid
  end
end
