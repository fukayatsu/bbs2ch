require 'mechanize'
require 'bbs2ch/response'
require 'time'

module BBS2ch
  class Thread
    def initialize(name, url, extra = {})
      @name = name
      @url = url
      @extra = extra
      @extra['thread'] = {name: @name, url: @url}
    end

    # TODO select, cache
    def responses

      @agent = Mechanize.new
      page = @agent.get @url

      responses = []
      page.body.toutf8.lines{|line|
        name, email, time_str, message = line.chomp.split(/<>/)
        responses << Response.new(name, email, Time.parse(time_str), message, extra)
      }
      responses
    end

    attr_accessor :name, :url, :extra
  end
end
