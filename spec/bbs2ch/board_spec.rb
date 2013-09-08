require 'spec_helper'

describe BBS2ch::Board do
  describe '#new' do
    before do
      @board = BBS2ch::Board.new('foo', 'http://example.com')
    end

    it 'has name' do
      expect(@board.name).to eq('foo')
    end

    it 'has url' do
      expect(@board.url).to eq('http://example.com')
    end
  end
end