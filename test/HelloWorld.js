const assert = require("assert");

const HelloWorld = artifacts.require("./HelloWorld.sol");

contract("HelloWorld", () => {
  it('sould return string', async () => {
    var contract = await HelloWorld.new();
    var result = await contract.get();
    assert.equal(result, "Hello World");
  });
});
