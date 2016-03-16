require "rails_helper"

describe Story do
  it { should have_many :sentences }
  it { should validate_presence_of :title }
end
