pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";


contract Identity is Ownable {

    string username;
    uint8 state;

    event IdentityCreated(address indexed owner, string indexed username, string pubKey);

    struct Conversation {
        uint8 state;
        string key;
        address recipient;
    }

    mapping(address => Conversation) conversations public;

    constructor() public{}

    function setup(address _owner, string _username) public onlyOwner {
        transferOwnership(_owner);
        setUsername(_username);
        state = 1;
        emit IdentityCreated(_owner, _username);
    }


    function setUsername(string _username) public onlyOwner {
        username = _username;
    }

    function conversationRequest(address _identity,) public {
        if (Identity(_identity).conversations[this].state ==2) && (conversations[_identity] <1) {
            conversations[_identity] = Conversation({pubkey : "", state : 1, initial_cid : ""});
        }
    }

    function makeConversation(address _identity, string _pubkey, string _messageCid, bool force) public onlyOwner {
        if ((conversations[_identity].state > 0) && (!force)) {
            revert();
        }
        conversations[_identity] = Conversation({pubkey : _pubkey, state : 2, initial_cid : _message_cid});
        Identity(_identity).conversationrequest

    }


}
