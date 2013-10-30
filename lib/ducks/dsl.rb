# encoding: utf-8

require 'ducks'

module Kernel
  def protocol(*args, &blk)
    Ducks.protocol *args, &blk
  end
end

class Object
  extend Ducks::ClassAPI
end
