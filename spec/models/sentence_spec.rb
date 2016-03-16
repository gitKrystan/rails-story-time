require "rails_helper"

describe Sentence do
  it { should belong_to :story }
  it { should validate_presence_of :author }
end
