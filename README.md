# Bbs2ch

A gem to read 2ch bbs

## Installation

Add this line to your application's Gemfile:

    gem 'bbs2ch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bbs2ch

## Usage

    require 'bbs2ch'

    menu = BBS2ch::Menu.new

    # all boards on 2ch
    all_boards = menu.boards

    # or select with name(regex)
    news_boards = menu.boards(/ニュース/)


    # all threads on first news_board
    threads = news_boards.first.threads

    # or select with name(regex)
    threads = news_boards.first.threads(/政治/)

    # get responses on the thread
    p threads.first.responses


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
