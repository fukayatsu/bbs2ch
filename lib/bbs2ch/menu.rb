require 'mechanize'
require 'bbs2ch/board'

module BBS2ch
  class Menu
    def initialize(url = nil)
      @url = url || "http://menu.2ch.net/bbsmenu.html"
    end

    #TODO select
    def boards(regex = /.*/)
      @agent = Mechanize.new
      page = @agent.get url

      boards = []
      page.links.each{|link|
        if link.href =~ /[^(www|info)]\.(2ch\.net|bbspink.com|machi\.to|)\//
          if link.text =~ regex
            boards << Board.new(link.text, link.href)
          end
        end
      }
      boards
    end

    attr_accessor :url
  end
end