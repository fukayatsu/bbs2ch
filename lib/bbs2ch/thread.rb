require 'time'

module BBS2ch
  class Thread
    def initialize(name, url, res_count)
      @name      = name
      @url       = url
      @res_count = res_count
      @posts     = nil
    end

    attr_accessor :name, :url, :res_count

    def posts
      @posts ||= load_posts
    end

    def load_posts
      body = Connection.new(@url).response_body
      body.each_line.map { |line|
        line.chomp!
        # [名前]<>[メール]<>[日付] [ID] [BE-ID]<>[本文]<>[スレッドタイトル]
        name, email, time_and_id, body, title = line.split('<>')

        body.gsub!('<BR>', "\n")

        begin
          time = Time.parse(time_and_id)
        rescue ArgumentError
          time = nil
        end
        time_and_id.match('ID:(\S+)')
        id = $1
        time_and_id.match('BE:(\S+)')
        be = $1

        Post.new(name, email, time, id, be, body, title)
      }
    end
  end
end