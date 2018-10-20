require 'services/service'

module Services

  module Github
    class Repositories < Service
      include HTTParty
      base_uri 'https://api.github.com'

      def list(token, username, user_token)
        self.class.get("/users/#{username}/repos?access_token=#{user_token}&type=all", {headers: self.headers(token)})
      end

      def show(token, name, user_token, username)
        self.class.get("/repos/#{username}/#{name}/commits?access_token=#{user_token}", {headers: self.headers(token)})
      end
    end
  end
end