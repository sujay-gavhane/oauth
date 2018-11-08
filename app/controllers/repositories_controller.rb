require 'services/github'

class RepositoriesController < ApplicationController
  before_action :authenticate_user
  
  def index
    @responses = github_service.list(
      ENV['GITHUB_SECRET_TOKEN'],
      session[:user_name], session[:token]
    )
    @responses = JSON.parse(@responses.body)
  end

  def get_repo_commits
    from_date = Date.strptime(params[:from_date], '%m/%d/%Y').strftime('%Y-%m-%d')
    to_date = Date.strptime(params[:to_date], '%m/%d/%Y').strftime('%Y-%m-%d')
    @response = github_service.show(
      ENV['GITHUB_SECRET_TOKEN'], params[:id],
      session[:token], session[:user_name], from_date, to_date
    )
    @response = JSON.parse(@response.body)
  end

  private

  def github_service
    Services::Github::Repositories.new
  end
end
