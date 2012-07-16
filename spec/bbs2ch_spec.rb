# coding: utf-8

# TODO オフラインでもテストできるようにする

require 'bundler'
Bundler.setup(:default, :test)

require 'bbs2ch'

describe BBS2ch do

  describe 'Menu' do

    context '#initialize' do
      it 'default url' do
        menu = BBS2ch::Menu.new
        menu.url.should == "http://menu.2ch.net/bbsmenu.html"
      end

      it 'custom url' do
        menu = BBS2ch::Menu.new("http://foo.net")
        menu.url.should == 'http://foo.net'
      end
    end

    context '#boards' do
      before do
        @menu = BBS2ch::Menu.new
      end

      it 'size not 0' do
        @menu.boards.size.should_not == 0
        #p @menu.boards(/料理/).first.threads(/料理/).first.responses.first
      end

    end
  end

  describe 'Board' do
    context '#initialize' do
    end
  end

  describe 'Thread' do
    context '#initialize' do
    end
  end

  describe 'Response' do
    context '#initialize' do
    end

    context '#images' do
      it 'return 2 images' do
        response = BBS2ch::Response.new('name', 'email', 'time', '
          http://hoge.com/hoge/piyo.jpg<br>
          ttp://hoge.com/hoge/piyo.png<br>')
        images = response.images
        images[0].url.should == 'http://hoge.com/hoge/piyo.jpg'
        images[1].url.should == 'http://hoge.com/hoge/piyo.png'
      end
    end
  end

  describe 'Image' do
    context '#initialize' do
    end
  end

end