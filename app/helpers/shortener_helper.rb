# frozen_string_literal: true

require 'digest/sha2'

module ShortenerHelper
  # class to shorten links
  class Shortener
    def initialize(url, table = Link)
      @url = url
      @table = table
    end

    def lookup_code
      loop do
        code = SecureRandom.hex(3)
        return code unless @table.exists?(lookup_code: code)
      end
    end
  end
end
