# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenerHelper do
  it 'shortens a given URL to a 7 character lookup code' do
    url = 'https://www.example.com'
    shortener = ShortenerHelper::Shortener.new(url)

    expect(shortener.lookup_code.length).to eq(6)
  end

  it 'gives each URL its own lookup code' do
    url1 = 'https://www.example.com/new-url'
    shortener = ShortenerHelper::Shortener.new(url1)
    code1 = shortener.lookup_code

    url2 = 'https://www.example1.com/extra-url'
    shortener = ShortenerHelper::Shortener.new(url2)
    code2 = shortener.lookup_code

    expect(code2).not_to eq(code1)
  end

  it 'generates a Link record with a unique lookup code' do
    url = 'https://www.example.com'
    shortener = ShortenerHelper::Shortener.new(url)
    link = shortener.generate_short_link

    expect(link.valid?).to be(true)
    expect(link.original_url).to eq(url)
  end
end
