// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-deed.git/deed.sol";

contract DssQuiver is DSDeed("DSSQuiver", "DSSQ") {
    constructor() {

    }

    function make() external {
        uint256 _id = mint(msg.sender);

    }
}
