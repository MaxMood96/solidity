==== Source: a.sol ====
contract A {
	uint x;
}
==== Source: b.sol ====
import "a.sol";
contract B is A {
	function g() public view { assert(x > x); }
}
==== Source: c.sol ====
import "b.sol";
contract C is B {
	function h(uint x) public pure { assert(x < x); }
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (b.sol:62-75): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\n\nTransaction trace:\nB.constructor()\nState: x = 0\nB.g()
// Warning 6328: (c.sol:68-81): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\nx = 0\n\nTransaction trace:\nC.constructor()\nState: x = 0\nC.h(0)
