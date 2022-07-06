# frozen_string_literal: true

require_relative "ipgeobase/version"

require "addressable/uri"
require 'happymapper'
require 'net/http'

module Ipgeobase
  class Error < StandardError; end

  def self.lookup(ip)
    uri = Addressable::URI.parse("http://ip-api.com/xml/#{ip}")
    meta_data = Net::HTTP.get(uri)
    HappyMapper.parse(meta_data)
  end
end
