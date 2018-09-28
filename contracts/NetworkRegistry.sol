pragma solidity ^0.4.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./MoonshrdToken.sol";
import "./Identity.sol";
import "./deps/TokenFactory.sol";
import "./deps/SubFactory.sol";

contract NetworkRegistry is Ownable {
    MoonshrdToken networkToken;
    TokenFactory tokenMaker;
    SubFactory subMaker;

    mapping(address => uint) lostCalls;

    mapping(address => address) users;

    function construct(){
        networkToken = new MoonshrdToken();

    }

    function setToken(address _token) public onlyOwner {
        networkToken = MoonshrdToken(_token);
    }

    function getToken() public view returns (address) {
        return address(networkToken);
    }

    function whoAmI() public returns (address){
        lostCalls[msg.sender]= lostCalls[msg.sender] + 1;

        return msg.sender;
    }

    function setTokenFactory(address _addr) public onlyOwner {
        tokenMaker = TokenFactory(_addr);
    }

    function setSubFactory(address _addr) public onlyOwner {
        subMaker = SubFactory(_addr);
    }

    function createIdentity(string _username) public returns (address){
        Identity newIdentity = new Identity(msg.sender,_username);

        networkToken.mint(msg.sender, 1 * 10**18);
        users[msg.sender] = address(newIdentity);

        return users[msg.sender];
    }

    function myIdentity() public view returns (address){
        return users[msg.sender];
    }


}
