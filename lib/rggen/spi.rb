# frozen_string_literal: true

require_relative 'spi/version'

RgGen.setup_plugin :'rggen-spi' do |plugin|
  plugin.version RgGen::SPI::VERSION
  plugin.files [
    'spi/register_block/protocol/spi.rb'
  ]
end
