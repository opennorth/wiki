# coding: utf-8
require 'fileutils'

# https://github.com/plusjade/jekyll-bootstrap/blob/master/Rakefile
desc 'Create a new blog post'
task :post, :host, :title do |t,args|
  class String
    def slug
      gsub(/[[:space:]—–-]+/, ' ').strip.downcase.gsub(/\p{Punct}|\p{Cntrl}/, '').split.join('-').tr(
        "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
        "aaaaaaaaaaaaaaaaaaccccccccccddddddeeeeeeeeeeeeeeeeeegggggggghhhhiiiiiiiiiiiiiiiiiijjkkkllllllllllnnnnnnnnnnnoooooooooooooooooorrrrrrsssssssssttttttuuuuuuuuuuuuuuuuuuuuwwyyyyyyzzzzzz")
    end
  end

  time = Time.now
  slug = args[:title].slug
  path = "#{args[:host]}/_posts/#{time.strftime('%Y-%m-%d')}-#{slug}.md"

  Dir.chdir Dir.pwd

  FileUtils.mkdir_p "#{args[:host]}/_posts"
  File.open(path, 'w') do |f|
    f.write <<-eos
---
layout: post
title: "#{args[:title]}"
type: article
author: 
date: #{time.strftime '%Y-%m-%d %H:%M:%S'}
---
eos
  end
  puts "Created #{path}"
end

desc "Copy assets files to a host's source directory"
task :prepare, :host do |t,args|
  Dir.chdir Dir.pwd
  list = %w(assets).map do |dir|
    File.join(dir, '.')
  end
  FileUtils.cp_r list, args[:host]
end

desc 'Serve a host from a local WEBrick server'
task :server, [:host] => :prepare do |t,args|
  exec "bundle exec bin/jekyll serve --config _config.yml -s #{args[:host]} -d _site/#{args[:host]} -w"
end

desc "Write HTML files to a host's destination directory"
task :deploy, [:host, :dest] => :prepare do |t,args|
  exec "bundle exec bin/jekyll build --config _config.yml -s #{args[:host]} -d #{args[:dest]}"
end

desc 'Remove ignored files'
task :clean do
  Dir.chdir Dir.pwd
  list = %w(assets).reduce([]) do |memo,dir|
    memo += Dir.entries(dir) - %w(. ..)
  end

  FileUtils.rm_rf '_site', secure: true

  root = Dir.pwd
  %w(blog.opennorth.ca blogue.nordouvert.ca opennorth.ca nordouvert.ca).each do |host|
    Dir.chdir File.join(root, host)
    FileUtils.rm_rf list, secure: true
  end
end
