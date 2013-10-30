# encoding: utf-8

require 'ducks/protocol'
require 'ducks/api'

describe "Object API" do
  FooProtocol = Ducks.protocol do defines :foo; end

  describe "checks own implementation" do
    let ( :implementor ) { Object.new.tap{|impl|
        def impl.foo; end
        impl.extend Ducks::API
      }
    }

    it "with the protocol" do
      expect(implementor).to be_implements FooProtocol
    end
  end

  describe "class api" do
    it "raises an exception" do
      expect {
        Class.new do
          extend Ducks::ClassAPI
          implements FooProtocol
        end
      }.to raise_error( Ducks::ProtocolNotImplementedError )
    end

    describe "including the object api" do
      describe "raises" do
        let( :klass ) {
          Class.new do
            extend Ducks::ClassAPI
          end
        }
        let( :implementor ) { klass.new }
        it "tests for implementation" do
          expect( implementor ).to_not be_implements FooProtocol
        end

        it "excepts" do
          expect{
            implementor.implements! FooProtocol
          }.to raise_error( Ducks::ProtocolNotImplementedError )
        end
      end
    end
  end
end
