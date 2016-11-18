require 'pry'
require 'rb-readline'

module Jekyll
  module Utility
    def clip_char(str, char='-')
      str = str.to_s
      str = if str[0] == char
              str[1...str.length]
            else
              str
            end
      if str[-1] == char
        str[0...-1]
      else
        str
      end
    end

    def hash_link(text)
      "##{text.to_s}"
    end

    def snakecase(text)
      text = text.to_s
      text = text.downcase.gsub(/[^a-z\0-9\s]/, '').gsub(/\W+/, '-')
      clip_char(text)
    end

    def matches_url(page_url, url)
      page_url = clip_char(page_url.to_s.downcase, '/')
      url = clip_char(url.to_s.downcase, '/')
      page_url == url || nil
      # binding.pry
    end

    def find_page(page_url, nav_items)
      match = {}
      # binding.pry
      nav_items.each do |item|
        # binding.pry
        if item['permalink'] == '/join/'
          # binding.pry
        end
        if matches_url(page_url, item['permalink'])
          # binding.pry
          match = item
        end
      end
      # if page_url == '/join/'
      #   binding.pry
      # end
      match
    end

    def check_type(value)
      type = value.class
      puts '---------------------'
      puts "#{value} is a #{type}"
      puts '---------------------'
      binding.pry
    end
  end
end
Liquid::Template.register_filter(Jekyll::Utility)
