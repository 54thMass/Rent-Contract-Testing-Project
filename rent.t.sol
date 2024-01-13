import "ds-test.sol";
import "rent.sol";

contract RentTest is DSTest {
Rent rent;

function setup() public {
    rent = new Rent("Humayun", 30, "Engineer");
}

function testTenantInfo() public {
    (string memory name, uint age, string memory occupation) = rent.tenantInfo();
    assertEq(name, "Alice");
    assertEq(age, 30);
    assertEq(occupation, "Engineer");
}

function testRentPayment() public {
address(rent).call{value: 1 ether}("");
assertEq(address(landlord).balance, 1 ether);
}

}