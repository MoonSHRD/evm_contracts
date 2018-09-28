pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract MoonshrdToken is MintableToken {
    string public name = "Moonshard Network Token";
    uint8 public decimals = 18;
    string public symbol = "MNSHRD_INNER";

    constructor() public {

    }


}
