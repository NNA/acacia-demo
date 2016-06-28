require 'rails_helper'

describe ProjectsController do

  let(:project_params) do
    {
      'name' => 'project name',
      'description' => 'my description',
      'place'       => 'my place',
      'category_id' => '2',
      'amount'      => '3000'
    }
  end

  before do
    allow(ProjectService).to receive(:new).and_return(@project_service = double('project service'))
  end

  describe '#index' do
    it 'asks project service to list projects and renders index view' do
      allow(@project_service).to receive(:list).and_return ['list', 'of' , 'projects']
      
      get :index
      
      expect(assigns(:projects)).to eq ['list', 'of' , 'projects']
      expect(response).to render_template :index
    end
  end

  describe '#new' do
    it 'asks project service to populate a new project and renders :new view' do
      expect(@project_service).to receive(:build_new).and_return(new_project = double('project service'))
      get :new
      
      expect(assigns(:project)).to    eq new_project
    end
  end

  describe '#create' do
    it 'asks project service to save a new projects and renders :show view if successfully saved' do
      expect(@project_service).to receive(:create).with(project_params).and_return([true, created_project = OpenStruct.new(id: 42)])
      
      post :create, project: project_params
      
      expect(flash[:notice]).to_not be_empty
      expect(assigns(:project)).to eq created_project
      expect(response).to redirect_to project_path(42)
    end

    it 'asks project service to save a new projects and renders :new view if service says save failed' do
      expect(@project_service).to receive(:create).with(project_params).and_return([false, failed_project = double('project')])
      
      post :create, project: project_params
      
      expect(flash[:error]).to_not be_empty
      expect(assigns(:project)).to eq failed_project
      expect(response).to render_template :new
    end
  end

  describe '#show' do
    it 'assigns @project and renders show if project found' do
      expect(@project_service).to receive(:find).with('37').and_return([true, 'the project'])

      get :show, id: '37'

      expect(assigns(:project)).to eq 'the project'
      expect(response).to          render_template :show
    end

    it 'redirects to :index with error if project not found' do
      expect(@project_service).to receive(:find).with('37').and_return([false, nil])

      get :show, id: '37'

      expect(assigns(:project)).to be_nil
      expect(flash[:error]).to_not be_empty
      expect(response).to redirect_to projects_path
    end
  end

end