require "rails_helper"

describe Image do
  it { should have_many(:sentences) }
end
