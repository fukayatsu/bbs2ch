require 'mechanize'


module BBS2ch
  class Image
    def initialize(url, extra={})
      @url = url
      @extra = extra
    end

    attr_accessor :url, :extra
  end
end