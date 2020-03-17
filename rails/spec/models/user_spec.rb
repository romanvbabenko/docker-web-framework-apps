require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:f_name) }
    it { is_expected.to validate_presence_of(:l_name) }
  end
end
