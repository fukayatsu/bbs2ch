require 'mechanize'
require 'bbs2ch/response'
require 'time'

module BBS2ch
  class Thread
    def initialize(name, url, extra = {})
      @name = name
      @url = url
      @extra = extra
      @extra[:thread] = {name: @name, url: @url}
    end

    # TODO select, cache
    def responses

      @agent = Mechanize.new
      page = @agent.get @url

      responses = []
      page.body.toutf8.lines{|line|
        responses << Response.parse(line)
      }
      responses
    end

    attr_accessor :name, :url, :extra
  end
end
