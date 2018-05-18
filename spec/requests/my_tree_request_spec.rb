require 'rails_helper'

RSpec.describe 'MyTree Requests', type: :request do
  let!(:root_node) { MyTree.create(name: "root") }
  let!(:child_node) { root_node.children.create(name: "child") }

  describe '#index' do
    before { get '/my_tree/index' }

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
end
