pragma solidity ^0.4.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./MoonshrdToken.sol";
import "./Identity.sol";
import "./TokenFactory.sol";
import "./SubFactory.sol";

contract NetworkRegistry is Ownable {
    MoonshrdToken networkToken;
    TokenFactory tokenMaker;
    SubFactory subMaker;

    mapping(address => Identity) users;

    function construct(){}

    function setToken(address _token) public onlyOwner {
        networkToken = MoonshrdToken(_token);
    }

    function setTokenFactory(address _addr) public onlyOwner {
        tokenMaker = TokenFactory(_token);
    }

    function setSubFactory(address _addr) public onlyOwner {
        subMaker = SubFactory(_token);
    }

    function createIdentity(string _username) public returns (address){
        if (users[msg.sender].state > 0) {
            revert();
            _;
        }

        Identity newIdentity = new Identity();
        newIdentity.setup(msg.sender, _username);

        return address(newIdentity);

    }


}
