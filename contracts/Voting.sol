pragma solidity ^0.8.0;
// We have to specify what version of compiler this code will compile with

contract Voting {
  /* mapping field below is equivalent to an associative array or hash.
  The key of the mapping is candidate name stored as type bytes32 and value is
  an unsigned integer to store the vote count
  */
  
  mapping (string => uint256) public votesReceived;
  
  string[] public candidateList;

  /* This is the constructor which will be called once when you
  deploy the contract to the blockchain. When we deploy the contract,
  we will pass an array of candidates who will be contesting in the election
  */
  constructor() public {
    candidateList = ["Johnny", "Amber", "Daniel"];
  }

  // This function returns the total votes a candidate has received so far
  function totalVotesFor(string memory candidate) view public returns (uint256) {
//    require(validCandidate(candidate));
    return votesReceived[candidate];
  }

  // This function increments the vote count for the specified candidate. This
  // is equivalent to casting a vote
  function voteForCandidate(string memory candidate) public {
//    require(validCandidate(candidate));
    votesReceived[candidate] += 1;
  }

  function validCandidate(string memory candidate) view public returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {

      if (keccak256(bytes(candidateList[i])) == keccak256(bytes(candidate))){
        return true;
      }
    }
    return false;
  }

  function getCandidateList() public view returns (string[] memory){
	return candidateList;
  }  
}
