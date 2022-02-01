// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-deed/deed.sol";
import "./DssProxy.sol";

contract DssQuiver is DSDeed("DSSQuiver", "DSSQ") {
    constructor() {
    }

    function make() external returns (uint256 id, address proxy) {
        uint256 id = _mint(msg.sender, "");
        address proxy = address(new DssProxy(address(this), id));
    }
}
