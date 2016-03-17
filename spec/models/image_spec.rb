require "rails_helper"

describe Image do
  it { should have_many(:sentences) }

  context '#random' do
    it 'will return a random image' do
      expect(Image.random).to be_truthy
    end
  end
end
