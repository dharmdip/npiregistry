require 'net/http'
require 'json'
require 'ostruct'

module Npiregistry

  class Request

    URL = "https://npiregistry.cms.hhs.gov/api"

    def self.execute(args)
      new(args).execute
    end

    def initialize args
      @options = (args[:options] || {}).dup
    end

    def execute
      return 'Please make sure there are enough parameters to make request.' if @options.empty?
      make_request
    end

    def process_parameters
      options = OpenStruct.new(@options)
      {
          number: options.number,
          enumeration_type: options.enumeration_type,
          taxonomy_description: options.taxonomy_description,
          first_name: options.first_name,
          last_name: options.last_name,
          organization_name: options.organization_name,
          address_purpose: options.address_purpose,
          city: options.city,
          state: options.state,
          postal_code: options.postal_code,
          country_code: options.country_code,
          limit: options.limit,
          skip: options.skip
      }.delete_if { |key, val| val.nil? }
    end

    def make_request
      uri = URI URL
      uri.query = URI.encode_www_form process_parameters
      JSON.parse Net::HTTP.get_response(uri).body
    end

    def default_headers
      {
          :accept => '*/*',
          :user_agent => "NpiregistryRubyGem/#{Npiregistry::VERSION}"
      }
    end

  end

end