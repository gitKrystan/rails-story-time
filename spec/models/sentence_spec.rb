require "rails_helper"

describe Sentence do
  it { should belong_to :story }
  it { should belong_to :image }
  it { should validate_presence_of :author }
  it { should validate_length_of :content }
end
