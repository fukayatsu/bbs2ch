require 'faraday'
require 'kconv'

module BBS2ch
  class Client
    def initialize
      load_menu
    end

    def categories(regex = nil)
      load_menu unless @categories
      return @categories unless regex

      @categories.select { |category| category.name.match(regex) }
    end

    def boards(regex = nil)
      load_menu unless @boards
      return @boards unless regex

      @boards.select { |board| board.name.match(regex) }
    end

    def load_menu
      body = Connection.new('http://menu.2ch.net/bbsmenu.html').response_body

      start_pos = body.index('<BR><BR><B>')
      body = body[start_pos..-1].gsub(/<!--.*-->/m, '')

      @categories = []
      @boards = []

      category = nil
      body.each_line do |line|
        line.chomp!

        if line.match('<BR><BR><B>(.+)</B><BR>')
          name = $1
          category = Category.new(name)
        elsif line.match('<A HREF=(.+)/>(.+)</A>')
          name = $2
          url  = $1
          board = Board.new(name, url)
          category.boards << board
          @boards         << board
        elsif line.length == 0
          @categories     << category
        else
          # break
        end
      end

      self
    end
  end
end