// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";

contract ZuriToken is ERC20, Ownable {
    uint256 public tokenRate = 1000;

    constructor() ERC20("ZuriToken", "zuri") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address receiver, uint256 amount) public onlyOwner {
        _mint(receiver, amount);
    }

    function buyToken (address receiver) external payable {
        mint(receiver, tokenRate);
    }
}
