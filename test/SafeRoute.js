var SafeRoute = artifacts.require("SafeRoute");

contract('SafeRoute', function(accounts) {
  let contract;

  beforeEach(async () => {
    contract = await RDWToken.new();
  });

  it("should put 10000 RDWToken in the first account", async function() {
    //act
    await contract.mint(10000, {from: accounts[0]});

    //assert
    const balance = await contract.balanceOf(accounts[0]);
    assert.equal(parseInt(balance), 10000, "10000 wasn't in the first account");
  });

  ...
});