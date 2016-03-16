require "rails_helper"

describe Story do
  it { should have_many(:sentences).dependent :destroy }
  it { should accept_nested_attributes_for :sentences }
  it { should validate_presence_of :title }
end
