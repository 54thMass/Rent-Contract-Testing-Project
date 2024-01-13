//SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Rent {

address payable private landlord;

struct Tenant {
    string name;
    uint age;
    string occupation;
    }

Tenant public tenantInfo;

constructor(string memory _name, uint _age, string memory _occupation) {
landlord = payable(msg.sender);
tenantInfo = Tenant(_name, _age, _occupation);

}

receive() external payable{
(bool sent, ) = landlord.call{value:address(this).balance}("");
require(sent, "failed to send rent!");
}

}