require 'services/service'

module Services

  module Github
    class Repositories < Service
      include HTTParty
      base_uri 'https://api.github.com'

      def list(token, username)
        self.class.get("/users/#{username}/repos?&type=all", {headers: self.headers(token)})
      end

      def show(token, name, username, from_date, to_date)
        self.class.get("/repos/#{username}/#{name}/commits?&since=#{from_date}&until=#{to_date}", {headers: self.headers(token)})
      end
    end
  end
end
