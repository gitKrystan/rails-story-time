require "rails_helper"

describe Sentence do
  it { should belong_to :story }
end
