pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";


contract Identity is Ownable {

    string Username;
    uint8 State;

    event IdentityCreated(address indexed owner, string indexed username);

    struct Conversation {
        uint8 state;
        string key;
        string initial_cid;
    }

    mapping(address => Conversation) conversations;

    constructor(address _owner, string _username) public{
        transferOwnership(_owner);
        setUsername(_username);
        State = 1;
        emit IdentityCreated(_owner, _username);
    }



    function setUsername(string _username) public onlyOwner {
        Username = _username;
    }

    function conversationRequest(address _identity) public {
        //        if (Identity(_identity).conversations[this].state ==2) && (conversations[_identity] <1) {
                    conversations[_identity] = Conversation({key : "", state : 1, initial_cid : ""});
        //        }
    }

    function makeConversation(address _identity, string _pubkey, string _messageCid, bool force) public onlyOwner {
        if ((conversations[_identity].state > 0) && (!force)) {
            revert();
        }
        conversations[_identity] = Conversation({key : _pubkey, state : 2, initial_cid : _messageCid});
        Identity(_identity).conversationRequest(this);

    }


}
