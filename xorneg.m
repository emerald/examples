% Simulate bitwise negation using integer negation and subtraction.
% Simulate bitwise xor using bitwise and, or, and negation.
% Show (briefly) that they work as intended.

const xorneg <- object xorneg
  function neg[x : Integer] -> [y : Integer]
    y <- -x - 1
  end neg
  function xor[x : Integer, y : Integer] -> [z : Integer]
    z <- (x | y) & self.neg[(x & y)]
  end xor
  initially

    % Show that the bitwise negation of 0 is (-1), and that the
    % bitwise-negation of (-1) is 0.
    stdout.putstring["(neg)   0  ~> " || (self.neg[0]).asstring || "\n"]
    stdout.putstring["(neg) (-1) ~>  " || (self.neg[-1]).asstring || "\n"]

    stdout.putstring["\n"]

    % Show the truth-table of xor.
    stdout.putstring["0 (xor) 0 ~> " || (self.xor[0,0]).asstring || "\n"]
    stdout.putstring["0 (xor) 1 ~> " || (self.xor[0,1]).asstring || "\n"]
    stdout.putstring["1 (xor) 0 ~> " || (self.xor[1,0]).asstring || "\n"]
    stdout.putstring["1 (xor) 1 ~> " || (self.xor[1,1]).asstring || "\n"]
  end initially
end xorneg
