# encoding: utf-8
require 'ducks/protocol'

describe "Protocol definition" do
  describe "open arity methods" do
    let( :protocol ) { Ducks.protocol do defines :foo; end }
    subject { protocol }

    describe "correctly implemented" do
      let( :implementor ) {
        Object.new.tap{|impl| def impl.foo; end }
      }

      it { should be_implemented_by implementor }
    end

    describe "unimplemented" do
      let( :implementor ){ Object.new }

      it { should_not be_implemented_by implementor }
    end

    describe "with different implementation arity" do
      let( :implementor ) {
        Object.new.tap{|impl| def impl.foo(x); end }
      }

      it { should be_implemented_by implementor }
    end
  end

  describe "zero arity methods" do
    let( :protocol ) { Ducks.protocol do defines :foo, 0; end }
    subject { protocol }

    describe "correctly implemented" do
      let( :implementor ) {
        Object.new.tap{|impl| def impl.foo; end }
      }

      it { should be_implemented_by implementor }
    end

    describe "with different implementation arity" do
      let( :implementor ) {
        Object.new.tap{|impl| def impl.foo(x); end }
      }

      it { should_not be_implemented_by implementor }
    end
  end
end
