require 'rails_helper'

RSpec.describe Project, type: :model do

  it 'persists and supports mass assignment' do
    project = Project.create(name: 'Mon Projet', description: 'Ma description', place: "Mon endroit", category_id: 1, amount: 10000)
    project.reload

    expect(project.name).to         eq 'Mon Projet'
    expect(project.description).to  eq 'Ma description'
    expect(project.place).to        eq 'Mon endroit'
    expect(project.category_id).to  eq 1
    expect(project.amount).to       eq 10000
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of      :name }
    it { is_expected.to validate_presence_of      :description }
    it { is_expected.to validate_presence_of      :place }
    it { is_expected.to validate_presence_of      :category_id }
    it { is_expected.to validate_presence_of      :amount }
    it { is_expected.to validate_numericality_of  :amount }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:category) }
  end

  describe 'scopes' do
    it '#with_categories' do
      expect(Project.with_categories.includes_values.first).to eq :category
    end

    it '#recent sorts the projects by creation date descending' do
      expect(Project.recent.order_values).to eq ['created_at DESC']
    end
  end
end