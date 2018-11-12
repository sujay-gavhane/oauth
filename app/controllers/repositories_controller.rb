require 'services/github'
# Repositories controller
class RepositoriesController < ApplicationController
  before_action :authenticate_user
  
  def index
    @responses = github_service.list(
      ENV['GITHUB_SECRET_TOKEN'],
      session[:user_name], session[:token]
    )
    @responses = JSON.parse(@responses.body)
  end

  def repo_commits
    from_date = Date.strptime(params[:from_date], '%m/%d/%Y')
                    .strftime('%Y-%m-%d')
    to_date = Date.strptime(params[:to_date], '%m/%d/%Y').strftime('%Y-%m-%d')
    b = []
    @response = github_service.show(
      ENV['GITHUB_SECRET_TOKEN'], params[:id],
      session[:token], session[:user_name], from_date, to_date
    )
    @response = JSON.parse(@response.body)
    @graph_data = @response.group_by { |res| res['commit']['committer']['date'].to_date}.map { |a| { a[0].strftime('%d') => a[1].count } }.reduce Hash.new, :merge
  end

  private

  def github_service
    Services::Github::Repositories.new
  end
end
