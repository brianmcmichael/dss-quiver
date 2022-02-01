// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-deed/deed.sol";
import "./DssProxy.sol";

// NFT Proxy manager
contract DssQuiver is DSDeed("DSSQuiver", "DSSQ") {

    mapping (uint256 => address) proxies;

    constructor() {
    }

    function make() external returns (uint256 id, address proxy) {
        // TODO precalculate address with create2 and use it as the NFT label
        uint256 id = _mint(msg.sender, "");
        address proxy = address(new DssProxy(address(this), id));
        proxies[id] = proxy;
    }
}
