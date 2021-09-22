require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:participants) }
    it { should have_many(:teams).through(:participants) }
  end
end 
