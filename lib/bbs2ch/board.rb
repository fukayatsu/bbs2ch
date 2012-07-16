require 'mechanize'
require 'bbs2ch/thread'

SUBJECT_FILE = "subject.txt"

module BBS2ch
  class Board
    def initialize(name, url, extra = {})
      @name = name
      @url = url
      @extra = extra
      @extra[:board] = {url: @url, name: @name}
    end

    # TODO select
    def threads(regex = /.*/)

      @agent = Mechanize.new
      page = @agent.get(url + SUBJECT_FILE)

      threads = []
      page.body.toutf8.lines{|line|
        th_dat, th_name = line.chomp.split(/<>/)
        if th_name =~ regex
          threads << Thread.new(th_name, "#{@url}dat/#{th_dat}", @extra)
        end
      }
      threads
    end

    attr_accessor :name, :url, :extra
  end
end