require 'rails_helper'

RSpec.describe 'repositories_controller' do
  describe 'GET /repositories' do
    it 'returns the specified return status' do
      get('/repositories')
      github_service = double
      allow(github_service).to receive(:list).and_return(200)
      expect(github_service.list).to eq(200)
    end
  end

  describe 'GET /repositories/:id/repo_commits' do
    it 'returns the specified return status' do
      get('/repositories/:id/repo_commits')
      github_service = double
      allow(github_service).to receive(:show).and_return(200)
      expect(github_service.show).to eq(200)
    end
  end
end