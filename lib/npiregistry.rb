require 'npiregistry/version'
require 'npiregistry/request'

module Npiregistry

  def self.get(options={})
    Request.execute(options: options)
  end

end


