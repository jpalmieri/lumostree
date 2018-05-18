require 'rails_helper'

RSpec.describe 'MyTree Requests', type: :request do
  let!(:root_node) { MyTree.create(name: "root") }
  let!(:other_root_node) { MyTree.create(name: "other_root_node") }
  let!(:child_node) { root_node.children.create(name: "child") }
  let!(:other_child_node) { other_root_node.children.create(name: "other child") }

  describe '#index' do
    before { get '/my_tree' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'displays root nodes' do
      expect(response.body).to include(root_node.name)
      expect(response.body).to include(other_root_node.name)
    end

    it 'does not display children nodes' do
      expect(response.body).to_not include(child_node.name)
    end
  end

  describe '#edit' do
    before { get "/my_tree/#{root_node.id}/edit" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'displays root node' do
      expect(response.body).to include(root_node.name)
      expect(response.body).to_not include(other_root_node.name)
    end

    it 'displays children nodes associated with root node' do
      expect(response.body).to include(child_node.name)
      expect(response.body).to_not include(other_child_node.name)
    end
  end

  describe '#create' do
    let(:new_node) { MyTree.new(name: 'new node') }
    let(:last_node) { MyTree.all.last }
    before { post '/my_tree', params: { name: new_node.name } }

    it 'creates the node' do
      expect(last_node.name).to eq(new_node.name)
    end

    it 'redirects to edit page' do
      expect(response).to have_http_status(302)
      expect(response.header['Location']).to include("/my_tree/#{last_node.id}/edit")
    end
  end

  describe '#update' do
    let(:new_node) { MyTree.new(name: 'new node') }
    let(:last_child) { root_node.children.last }
    before { put "/my_tree/#{root_node.id}", params: { name: new_node.name } }

    it 'updates the node' do
      expect(last_child.name).to eq(new_node.name)
    end

    it 'redirects to edit page' do
      expect(response).to have_http_status(302)
      expect(response.header['Location']).to include("/my_tree/#{root_node.id}/edit")
    end
  end
end
