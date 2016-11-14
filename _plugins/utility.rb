module Jekyll
  module Utility
    def strip_dashes(str)
      str = str.to_s
      str = if str[0] == '-'
              str[1...str.length]
            else
              str
            end
      if str[-1] == '-'
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
      strip_dashes(text)
    end
  end
end
Liquid::Template.register_filter(Jekyll::Utility)
