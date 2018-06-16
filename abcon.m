% Author: unknown
% # of nodes needed to run: 1
% Sample output: abcon.stdout
%
% This example illustrates the following:
%
% 1. The various put* methods under stdout.
%
% 2. stdout.putint takes an additional width parameter, and pads with
%    spaces to align the integer to the right.
%
% 3. Emerald strings and ints both have an asString method. This is
%    shown by (at the same time) exhibiting type conformity in
%    Emerald: A type For sample output, see abcon.stdout `printable`
%    is defined, having an `asString` method. Strings and ints are
%    then passed in places where a `printable` is expected.
%
% 4. You can request a string representation of any Emerald object,
%    using the `nameof` construct.

const abcon <- object abcon
  const printable <- typeobject printable
    function asString -> [String]
  end printable

  const thingtype <- typeobject thingtype
    operation foo[printable, integer, any]
    operation bar[printable]
  end thingtype

  const thing <- object thing
    export operation foo [a : printable, b : integer, c : any]
      stdout.putstring["foo: "]
      stdout.putstring[a.asString]
      stdout.putint[b, 10]
      stdout.putchar[' ']
      stdout.putstring[nameof c]
      stdout.putchar['\n']
    end foo
    export operation bar [a : printable]
      stdout.putstring["bar: "]
      stdout.putstring[a.asString]
      stdout.putchar['\n']
    end bar
  end thing
  initially
    thing.foo["abc", 5, 7]
    thing.bar[5]
  end initially
end abcon
