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
      matches = page_url == url || nil
    end
  end
end
Liquid::Template.register_filter(Jekyll::Utility)
