module BBS2ch
  class Category
    def initialize(name, boards = [])
      @name   = name
      @boards = boards
    end

    attr_accessor :name, :boards
  end
end