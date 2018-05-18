require 'rails_helper'

RSpec.describe 'MyTree Requests', type: :request do
  let!(:root_node) { MyTree.create(name: "root") }
  let!(:child_node) { root_node.children.create(name: "child") }

  describe '#index' do
    before { get '/my_tree' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'displays root nodes' do
      expect(response.body).to include(root_node.name)
    end

    it 'does not display child nodes' do
      expect(response.body).to_not include(child_node.name)
    end
  end

  describe '#edit' do
    before { get "/my_tree/#{root_node.id}/edit" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'displays root nodes' do
      expect(response.body).to include(root_node.name)
    end

    it 'displays children nodes' do
      expect(response.body).to include(child_node.name)
    end
  end

  describe '#create' do
    let(:new_node) { MyTree.new(name: 'new node') }
    before { post '/my_tree', params: { name: new_node.name } }

    it 'creates the node' do
      expect(MyTree.all.last.name).to eq(new_node.name)
    end
  end

  describe '#update' do
    let(:new_node) { MyTree.new(name: 'new node') }
    before { put "/my_tree/#{root_node.id}", params: { name: new_node.name } }

    it 'updates the node' do
      expect(root_node.children.last.name).to eq(new_node.name)
    end
  end
end
