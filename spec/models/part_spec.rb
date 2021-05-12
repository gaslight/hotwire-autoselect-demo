require 'rails_helper'

RSpec.describe Part, type: :model do
  subject(:part) { described_class.new }

  it { is_expected.to validate_presence_of(:part_number) }
  it { is_expected.to validate_uniqueness_of(:part_number) }
end
