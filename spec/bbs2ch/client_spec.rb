require 'spec_helper'

describe BBS2ch::Client do
  before(:all) do
    @client = BBS2ch::Client.new
  end

  describe '#new' do
    it 'has categories' do
      expect(@client.categories.length).to be > 0
    end

    it 'has boards' do
      expect(@client.boards.length).to be > 0
    end
  end

  describe '2ch' do
    it 'first category name' do
      expect(@client.categories.first.name).to eq('地震')
    end
  end
end