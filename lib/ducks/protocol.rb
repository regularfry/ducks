# encoding: utf-8

module Ducks
  # We subclass Module so that Ruby knows to pick out the constant
  # name for #inspect
  class Protocol < Module
    def initialize( &blk )
      @methods = []
      instance_exec &blk
    end


    def defines( *args )
      @methods << args
    end


    def implemented_by?( potential_anatid )
      @methods.all?{ |method_name,arity = :any,*_|
        check_method( potential_anatid, method_name, arity )
      }
    end

    def implemented_by_class?( potential_anatidae )
      @methods.all?{ |method_name, arity = :any, *_|
        check_instance_method( potential_anatidae, method_name, arity )
      }
    end

    private

    def arities_match?( protocol_arity, method_arity )
      protocol_arity == method_arity
    end



    def check_method( potential_anatid, method_name, arity )
      if potential_anatid.public_methods.include? method_name
        if arity == :any
          true
        else
          method = potential_anatid.method method_name
          arities_match? arity, method.arity
        end
      elsif potential_anatid.respond_to? method_name
        # looser test because we can't test arity, but we don't generate
        # any false positives as a consequence.
        true
      end
    end


    def check_instance_method( potential_anatidae, method_name, arity )
      # This is slightly problematic, because we generate false
      # positives.
      if potential_anatidae.public_instance_methods.include? method_name
        if arity == :any
          true
        else
          method = potential_anatidae.instance_method method_name
          arities_match? arity, method.arity
        end
      end
    end

  end


  def self.protocol(&blk)
    Protocol.new &blk
  end


end
