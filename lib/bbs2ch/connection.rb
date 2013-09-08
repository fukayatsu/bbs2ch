module BBS2ch
  class Connection
    def initialize(url)
      @conn = Faraday.new(url: url) do |faraday|
        # faraday.request  :url_encoded             # form-encode POST params
        # faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      @conn.headers[:user_agent] = 'Monazilla/1.00 (bbs2ch-rubygems/0.1.0)'
    end

    attr_accessor :conn

    def response_body
      @conn.get.body.toutf8
    end
  end
end