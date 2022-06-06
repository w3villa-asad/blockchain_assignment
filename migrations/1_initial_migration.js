const TestCoin = artifacts.require('TestCoin');

module.exports = function(deployer) {
  deployer.deploy(TestCoin, 1000000 * 10**18);
}