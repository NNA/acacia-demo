require 'rails_helper'

RSpec.describe ProjectService do

  subject { ProjectService.new }

  describe '#list' do
    it 'returns all projects with their categories' do
      allow(Project).to receive(:recent) { double('recent projects', with_categories: ['projects', 'with', 'categories']) }
      expect(subject.list).to eq ['projects', 'with', 'categories']
    end
  end

  describe '#build_new' do
  	it 'builds a new project' do
      project = subject.build_new({name: 'project name'})
      expect(project).to         be_kind_of Project
      expect(project).not_to     be_persisted
      expect(project.name).to    eq 'project name'
    end
  end

  describe '#create' do
    before do
      @params = {'project' => 'properties'}
    end

    it 'creates a new project with the given params hash, saves it and returns it with success result' do
      subject.stub(:build_new).with(@params).and_return(project_double = double('project'))
      project_double.should_receive(:save).and_return true
      
      expect(subject.create(@params)).to eq [true, project_double]
    end

    it 'creates a new project with the given params hash tries saving it and returns it with failure result because save failed' do
      subject.stub(:build_new).with(@params).and_return(project_double = double('project'))
      project_double.should_receive(:save).and_return false
      
      subject.create(@params).should eq [false, project_double]
    end
  end

  describe '#find' do
    it 'Use model to find project with given id and returns it with success result' do
      allow(Project).to receive(:find).with(37).and_return 'a project'
      
      expect(subject.find(37)).to eq [true, 'a project']
    end

    it 'returns false and nil in a array if project not found' do
      allow(Project).to receive(:find).with(37).and_raise 'some error'
      
      expect(subject.find(37)).to eq [false, 'some error']
    end
  end

end