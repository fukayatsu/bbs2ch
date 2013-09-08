module BBS2ch
  class Board
    def initialize(name, url)
      @name    = name
      @url     = url
      @threads = nil
    end

    attr_accessor :name, :url

    def threads(regex = nil)
      @threads ||= load_threads
      return @threads unless regex

      @threads.select { |thread| thread.name.match(regex) }
    end

    def load_threads
      body = Connection.new(url + '/subject.txt').response_body

      body.each_line.map { |line|
        line.chomp!

        title_end  = line.rindex(' ')
        dat, title = line[0...title_end].split('<>')
        res_count  = line[title_end + 1 .. -1][/[0-9]+/].to_i

        BBS2ch::Thread.new(title, "#{url}/dat/#{dat}", res_count)
      }
    end
  end
end
