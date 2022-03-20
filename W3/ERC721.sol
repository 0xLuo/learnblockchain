// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//import "ERC721.sol";

contract MyERC71 is ERC721 ,RandomlyAssigned{

    constructor(string memory _name, string memory _symbol) 
    ERC721(_name, _symbol)
    RandomlyAssigned(10000, 0)
    {

    }

    function claim() external {         
        _claim(msg.sender);     
    }      
    
    function claimFor(address to) external {         
        _claim(to);    
    }     

    function _claim (address to) internal {         
        uint256 next = nextToken();       
        _safeMint(to, next);     
    }      
}