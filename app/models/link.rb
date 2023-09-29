# frozen_string_literal: true

require 'open-uri'

# link model
class Link < ApplicationRecord
  validates_presence_of :lookup_code, :original_url
  validates_uniqueness_of :lookup_code

  def valid_url
    original_url =~ URI::DEFAULT_PARSER.make_regexp ? true : false
  end
end
