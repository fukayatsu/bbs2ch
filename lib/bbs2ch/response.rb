require 'mechanize'

module BBS2ch
  class Response
    def initialize(num, name, email, time, message)
      @num = num
      @name = name
      @email = email
      @time = time
      @message = message
    end

    attr_reader :num, :name, :email, :time, :message
  end
end