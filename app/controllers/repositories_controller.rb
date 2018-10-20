require 'services/github'

class RepositoriesController < ApplicationController
  def index
    @responses = github_service.list(ENV['GITHUB_SECRET_TOKEN'], session[:user_name], session[:token])
  end

  def show
    @response = github_service.show(ENV['GITHUB_SECRET_TOKEN'], params[:id], session[:token], session[:user_name])
    @response = JSON.parse(@response.body)
  end


  private

  def github_service
    Services::Github::Repositories.new
  end
end