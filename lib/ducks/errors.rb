# encoding: utf-8


module Ducks
  class ProtocolNotImplementedError < Exception
    attr_reader :protocol
    attr_reader :object
    def initialize( protocol, object )
      @protocol = protocol
      @object = object
      missing = protocol.missing_methods( object )
      super( "#{object.inspect} is missing #{missing.join(", ")} from #{protocol.inspect}" )
    end
  end

  class ClassProtocolNotImplementedError < ProtocolNotImplementedError
  end
end
