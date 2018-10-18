module Services
  class Service

    def headers(token)
      {'Authorization' => "Authorization: token #{token}", 'User-Agent' => "oauth-assignment", 'accept' => '*/*'}
    end
  end
end