require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'relationships' do
    it { should belong_to :leg }
  end
end