// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

interface ICreatureSystem {
  function redeem(
    string memory image,
    string memory meta,
    int32 longitude,
    int32 latitude,
    address spaceAddrs
  ) external returns (address);

  function nurture(bytes32 _entity, int32 _energy) external returns (bytes memory);
}
