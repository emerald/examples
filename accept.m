% Author: unknown
% # of nodes needed to run: 1
% Sample output: accept.stdout
%
% This example illustrates the following:
%
% 1. The `accept` construct inside an Emerald object `process` can be
%    used to enforce an order in which method calls on an object are
%    accepted. Non-matching method calls are post-poned until they
%    match a corresponding `accept` construct.

const foo <- object foo
  var j, k : Integer <- 5
  export operation baa [ i : Integer ]
    stdout.putstring["baa[1] - " || i.asString || "\n"]
  end baa

  export operation baa [ c : Character, s : String ]
    stdout.putstring["baa[2] - " || c.asString || " - " || s || "\n"]
    self.baa[3]
  end baa 


  process
    accept typeobject lamb op baa[Character, String] end lamb
    accept typeobject lamb op baa[Integer] end lamb
    accept typeobject lamb op baa[Integer] end lamb
    accept typeobject lamb op baa[Character, String] end lamb
    accept any
    accept any
  end process
end foo

const p0 <- object p1
  process
    foo.baa[2]
    foo.baa[2]
  end process
end p1

const p1 <- object p1
  process
    foo.baa[2]
    foo.baa[2]
  end process
end p1

const p2 <- object p1
  process
    foo.baa['x', "abc"]
    foo.baa['x', "abc"]
  end process
end p1

