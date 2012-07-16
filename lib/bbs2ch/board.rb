require 'mechanize'
require 'bbs2ch/thread'

SUBJECT_FILE = "subject.txt"

module BBS2ch
  class Board
    def initialize(name, url)
      @name = name
      @url = url
    end

    # TODO select
    def threads(regex = /.*/)
      @agent = Mechanize.new
      page = @agent.get(url + SUBJECT_FILE)

      threads = []
      page.body.toutf8.lines{|line|
        th_dat, th_name = line.chomp.split(/<>/)
        if th_name =~ regex
          threads << Thread.new(th_name, "#{@url}dat/#{th_dat}")
        end
      }
      threads
    end

    attr_accessor :name, :url
  end
end