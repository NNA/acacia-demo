require 'rails_helper'

RSpec.describe Category, type: :model do

  it 'persists and supports mass assignment' do
    category = Category.create(name: 'Elevage')
    category.reload

    expect(category.name).to eq 'Elevage'
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of      :name }
  end
end