// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./DssQuiver.sol";

contract DssQuiverTest is DSTest {
    DssQuiver quiver;

    function setUp() public {
        quiver = new DssQuiver();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
