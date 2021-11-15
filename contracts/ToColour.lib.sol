// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0 || ^0.8.0;

/// @title ToColour
library ToColour {

    bytes16 internal constant ALPHABET = "0123456789abcdef";

    // @function toColour
    function toColour(bytes32 value) internal pure returns (string memory) {
        bytes memory buffer = new bytes(6);
        for (uint256 i = 0; i < 3; i++) {
            buffer[i * 2 + 1] = ALPHABET[uint8(value[i]) & 0xf];
            buffer[i * 2] = ALPHABET[uint8(value[i] >> 4) & 0xf];
        }
        return string(buffer);
    }

}
