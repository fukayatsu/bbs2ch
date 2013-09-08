module BBS2ch
  class Post
    def initialize(name, email, time, id, be, body, title)
      @name  = name
      @email = email
      @time  = time
      @id    = id
      @be    = be
      @body  = body
      @title = title
    end

    def images
      fix_ttp @body.scan(%r{ttps?:.*\.(?:jpg|png|gif)})
    end

    def videos
      xvideos + fc2
    end

    def xvideos
      fix_ttp @body.scan(%r{ttp://(?:www|jp)\.xvideos\.com/video[0-9]+})
    end

    def fc2
      fix_ttp @body.scan(%r{ttp://video\.fc2\.com/a/content/[0-9a-zA-Z]+})
    end

    def fix_ttp(urls)
      urls.map { |url| url.gsub(/^ttp/, 'http') }
    end

    attr_accessor :name, :email, :time, :id, :be, :body, :title
  end
end