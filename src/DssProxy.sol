// SPDX-License-Identifier: AGPL-3.0-or-later
// Copyright (C) 2022 Dai Foundation
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

pragma solidity ^0.8.9;

interface NFT {
    function ownerOf(uint256) external returns (address);
}

contract DssProxy {

    uint256 immutable id;
    address immutable owner;

    event SetOwner(address indexed owner_);

    constructor(address owner_, uint256 id_) {
        owner = owner_;
        id = id_;
    }

    receive() external payable {
    }

    modifier onlyOwner {
        require(msg.sender == NFT(owner).ownerOf(id), "DssProxy/not-owner");
        _;
    }

    function execute(address _target, bytes memory _data)
        public
        onlyOwner
        payable
        returns (bytes memory response)
    {
        require(_target != address(0), "DssProxy/target-address-required");

        assembly {
            let succeeded := delegatecall(gas(), _target, add(_data, 0x20), mload(_data), 0, 0)
            let size := returndatasize()

            response := mload(0x40)
            mstore(0x40, add(response, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            mstore(response, size)
            returndatacopy(add(response, 0x20), 0, size)

            switch iszero(succeeded)
            case 1 {
                revert(add(response, 0x20), size)
            }
        }
    }
}
