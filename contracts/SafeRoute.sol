pragma solidity ^0.4.23;

import "./RDWToken.sol";

contract SafeRoute {
    address private owner;
    bytes32 private dossierHash;
    string private dossierPointer;
    address private tokenContract;

    mapping(address => uint) roadManagers;

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

    function addRoadManager(address _roadManager, uint32 _price) public onlyOwner {
        roadManagers[_roadManager] = _price;

        RDWToken token = RDWToken(tokenContract);
        token.mint(_price);
    }

    function withdraw() public returns(uint) {
        require(roadManagers[msg.sender] > 0);

        RDWToken token = RDWToken(tokenContract);
        require(token.balanceOf(this) >= roadManagers[msg.sender]);

        token.transfer(msg.sender, roadManagers[msg.sender]);
        return roadManagers[msg.sender];
    }
}