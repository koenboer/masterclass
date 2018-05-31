pragma solidity ^0.4.23;

import "./RDWToken.sol";

contract SafeRoute {
    address private owner;
    bytes32 private dossierHash;
    string private dossierPointer;
    address private tokenContract;

    // The field contains all raodManager with prices on the path
    mapping(address => uint) roadManagers;

    // onlyOwner is modifier which allows only owner to call function
    // example of usage in addRoadManager function
    modifier onlyOwner {
        if(msg.sender != owner) revert();
        _;
    }

    constructor(bytes32 _hash, string _pointer, address _tokenContract) public {
        owner = msg.sender;
        dossierHash = _hash;
        dossierPointer = _pointer;
        tokenContract = _tokenContract;
    }

    /*
    The function allows to add new road manager,
    it also increases amount of tokens for the contract, to bee sure
    thet it will be enough to pay at the end of the trip
    */
    function addRoadManager(address _roadManager, uint32 _price) public onlyOwner {
        roadManagers[_roadManager] = _price;

        RDWToken token = RDWToken(tokenContract);
        token.mint(_price);
    }

    // The function allows road managers to withdrow own tokens after the trip
    function withdraw() public returns(uint) {
        require(roadManagers[msg.sender] > 0);

        RDWToken token = RDWToken(tokenContract);
        require(token.balanceOf(this) >= roadManagers[msg.sender]);

        token.transfer(msg.sender, roadManagers[msg.sender]);
        return roadManagers[msg.sender];
    }
}