require 'net/http'
require 'json'
require 'addressable/uri'
require 'ostruct'

module Npiregistry

  class Request

    URL = "https://npiregistry.cms.hhs.gov/api"

    def self.execute(args)
      new(args).execute
    end

    def initialize args
      @options = (args[:options] || {}).dup
      @os_options = OpenStruct.new(@options)
      @url = URL
    end

    def execute
       return 'Please make sure there are enough parameters to make request.' if @options.empty?
       make_request
    end

    def process_parameters
      options = @os_options
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
      JSON.parse(::Net::HTTP.get(URI("#{@url}?#{prepare_params}")))
    end

    def prepare_params
      uri = Addressable::URI.new
      uri.query_values = process_parameters
      uri.query
    end

    def default_headers
      {
          :accept => '*/*',
          :user_agent => "NpiregistryRubyGem/#{Npiregistry::VERSION}"
      }
    end

  end

end