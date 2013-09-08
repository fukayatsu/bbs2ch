#!/usr/bin/env ruby

require 'bbs2ch'

client = BBS2ch::Client.new
board  = client.boards(/犬猫/).first #=> board: "犬猫大好き"
thread = board.threads(/猫画像/).first
posts  = thread.posts
puts posts.map(&:images).flatten
