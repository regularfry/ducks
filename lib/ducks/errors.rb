# encoding: utf-8


module Ducks
  class ProtocolNotImplementedError < Exception
    attr_reader :protocol
    attr_reader :object
    def initialize( protocol, object )
      @protocol = protocol
      @object = object
      super( "#{protocol.inspect} is not implemented by #{object.inspect}" )
    end
  end

  class ClassProtocolNotImplementedError < ProtocolNotImplementedError
  end
end
