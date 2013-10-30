# encoding: utf-8

require 'ducks/protocol'
require 'ducks/api'

module Ducks
  def self.extended( kls )
    kls.extend Ducks::ClassAPI
  end
end
