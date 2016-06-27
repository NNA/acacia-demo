require 'rails_helper'

describe ProjectsController do

  describe '#index' do

    # context 'given an anonymous user' do
    #   before do
    #     controller.stub(:current_user).and_return(nil)
    #   end
      it 'renders :index view' do
        get :index
        expect(response).to render_template :index
      end

      it 'asks project service to list projects' do
        allow(ProjectService).to receive(:new) {prj_svc = double('project service', list: ['list', 'of' , 'projects'])}
        
        get :index
        expect(assigns(:projects)).to eq ['list', 'of' , 'projects']
      end
    # end

    # context 'given a logged in user' do
    #   before do
    #     @current_user = stub_login
    #   end
    #   it 'renders :index view' do
    #     get :index
    #     response.should render_template :index
    #   end
    # end
  end

end