// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Geekt {

address GeektAdmin;

  mapping ( bytes32 => notarizedImage) notarizedImages; // this allows to look up notarizedImages by their SHA256notaryHash
  bytes32[] imagesByNotaryHash; // this is like a whitepages of all images, by SHA256notaryHash

  mapping ( address => User ) Users;   // this allows to look up Users by their ethereum address
  address[] usersByAddress;  // this is like a whitepages of all users, by ethereum address  

  struct notarizedImage{
    string imageUrl;
    uint timeStamp;
  }

  struct User{
    string handle;
    bytes32 city;
    bytes32 state;
    bytes32 country;
    bytes32 [] myImages;
  }

  function registerNewuser(string memory handle, bytes32 city, bytes32 state, bytes32 country ) public returns (bool success){
    address thisNewAddress = msg.sender;
    if (bytes(Users[msg.sender].handle).length==0 && bytes(handle).length!=0 ){
      Users[thisNewAddress].handle =  handle;
      Users[thisNewAddress].city = city;
      Users[thisNewAddress].state =  state;
      Users[thisNewAddress].country =  country;
      usersByAddress.push(thisNewAddress);
      return true;
      
    } else {
      return false;
    }
    
  }


}