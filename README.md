ducks
=====

The simplest possible protocol implementation that can possibly be useful.

First, define your protocol:

```ruby
require 'ducks'

Write = Ducks.protocol do
  defines :write, 1
end
```

Now, you can check whether an object implements this protocol:

```ruby

class NotAWriter; end

class AWriter
  def write(string)
  end
end


Write.implemented\_by? AWriter.new    # => true
Write.implemented\_by? NotAWriter.new # => false

```

There's a nicer API available:

```ruby

a\_writer = AWriter.new
a\_writer.extend Ducks::API

not\_a\_writer = NotAWriter.new
not\_a\_writer.extend Ducks::API

a\_writer.implements? Write      # => true
not\_a\_writer.implements? Write # => false

not\_a\_writer.implements! Write
  # => raises Ducks::ProtocolNotImplementedError( Write, not\_a\_writer )

```

And if you want class-level checking, you can do that too:

```ruby

class AnotherNotWriter
  extend Ducks

  implements Write
    # => raises Ducks::ClassProtocolNotImplementedError( Write, AnotherNotWriter )
end

```

You can strap `Ducks` in across the board by requiring `ducks/dsl`:

```ruby

require 'ducks/dsl'

Read = protocol do
  defines :read
end

File.open("/etc/passwd").implements? Read # => true
Read.implemented\_by\_class? File # => true
```

Weaknesses
----------

This only catches explicitly-defined interfaces.  It won't notice if
you implement a protocol with method_missing, even if you helpfully
add a respond\_to\_missing? definition.

Yet.


Author
------

Alex Young <alex@blackkettle.org>
