# encoding: utf-8

require 'ducks/errors'

module Ducks
  module API
    def implements?( protocol )
      protocol.implemented_by? self
    end

    def implements!( protocol )
      raise Ducks::ProtocolNotImplementedError.new( protocol, self ) unless
        implements?( protocol )
    end
  end

  module ClassAPI
    def implements( protocol )
      raise Ducks::ClassProtocolNotImplementedError.new( protocol, self ) unless
        protocol.implemented_by_class?( self )
    end

    def self.extended( kls )
      raise "Ducks::ClassAPI can only be used on classes" unless kls.is_a?( Class )
      kls.__send__(:include, Ducks::API)
    end
  end
end
