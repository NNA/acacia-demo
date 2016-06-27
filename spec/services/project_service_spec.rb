require 'rails_helper'

RSpec.describe ProjectService do

  describe '#list' do
    it 'returns all projects with their categories' do
      allow(Project).to receive(:recent) { double('recent projects', with_categories: ['projects', 'with', 'categories']) }
      expect(subject.list).to eq ['projects', 'with', 'categories']
    end
  end

end