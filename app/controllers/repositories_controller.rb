require 'services/github'

class RepositoriesController < ApplicationController
  def index
    @responses = github_service.list(ENV['GITHUB_SECRET_TOKEN'], session[:user_name], session[:token])
  end

  private

  def github_service
    Services::Github::Repositories.new
  end
end