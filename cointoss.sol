pragma solidity =0.5.16;

contract Coin
{
    //contract owners 
    uint256 amount;
    uint256 blockNumber;
    address payable[] bettors;
contructor(uint256 amount_) public
{
amount = amount_;   //creates contract and bet amount in wei
}
//place bet
function bet() payable public 
{
   require(msg.value == amount);
   require(bettors.length < 2);
   blockNumber = block.number + 1;
   bettors.push(msg.sender);
}
//Tosses Coin Pays Winner
function toss()public
{
    require(bettors.length == 2);
    require(blockNumber < block.number);
    uint256 winner = uint256(blockhash(block.number)) % 2;
    bettors[winner].transfer(address(this).balance);

}
