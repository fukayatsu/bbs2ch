require 'mechanize'
require 'bbs2ch/response'
require 'time'

module BBS2ch
  class Thread
    def initialize(name, dat_url)
      @name = name
      @dat_url = dat_url
    end

    # TODO select, cache
    def responses
      @agent = Mechanize.new
      page = @agent.get @dat_url

      responses = []
      page.body.toutf8.lines.with_index{|line, i|
        name, email, time_str, message = line.chomp.split(/<>/)
        responses << Response.new((i+1), name, email, Time.parse(time_str), message)
      }
      responses
    end

    attr_accessor :name, :dat_url
  end
end
