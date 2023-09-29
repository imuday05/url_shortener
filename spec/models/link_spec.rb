require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'is valid if it has an original URL and a lookup code' do
    link = Link.new(
      original_url: 'https://www.example.com',
      lookup_code: '123456'
    )

    expect(link.valid?).to be(true)
  end

  it 'is invalid if it does not have a lookup code' do
    link = Link.new(
      original_url: 'https://www.example.com'
    )

    expect(link.valid?).to be(false)
  end

  it 'is invalid if it does not have a original_url' do
    link = Link.new(
      lookup_code: '123456'
    )

    expect(link.valid?).to be(false)
  end

  it 'is invalid if the lookup code already exists' do
    link = Link.new(
      original_url: 'https://www.example.com',
      lookup_code: '123456'
    )
    link.save

    link2 = Link.new(
      original_url: 'https://www.example-helper.com',
      lookup_code: '123456'
    )

    expect(link2.valid?).to be(false)
  end
end
