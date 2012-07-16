require 'mechanize'
require 'bbs2ch/image'

module BBS2ch
  class Response
    def initialize(name, email, time, message, extra={})
      @name = name
      @email = email
      @time = time
      @message = message
      @extra = extra
      @extra[:response] =
        {name: @name, email: @email, time: @time, message: @message}
    end

    def images(regex = /((http|https|ttp):\/\/.*\.(jpg|png|gif))/)
      images = []
      @message.split(/<br>/).each{|line|
        match = line.scan regex
        if match.size > 0
          url = match[0][0]
          url = 'h' + url if url[0] != 'h'
          images << Image.new(url, @extra)
        end
      }
      images
    end

    # TODO arrayに対応
    def self.parse(text, extra={})
      name, email, time_str, message = text.chomp.split(/<>/)
      Response.new(name, email, Time.parse(time_str), message, extra)
    end

    attr_reader :name, :email, :time, :message, :extra
  end
end