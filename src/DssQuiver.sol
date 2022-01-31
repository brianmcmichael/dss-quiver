// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-deed/deed.sol";

contract DssQuiver is DSDeed("DSSQuiver", "DSSQ") {
    constructor() {

    }

    function make() external returns (uint256 id, address proxy) {
        address proxy;
        uint256 _id = mint(msg.sender);
    }
}
