require 'spec_helper'

describe BBS2ch::Category do
  describe '#new' do
    before do
      @category = BBS2ch::Category.new('地震', ['board1'])
    end

    it 'has name' do
      expect(@category.name).to eq('地震')
    end

    it 'has boards' do
      expect(@category.boards.length).to be > 0
    end
  end
end