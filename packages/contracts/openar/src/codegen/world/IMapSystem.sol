// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

interface IMapSystem {
  function openar_MapSystem_createMap(string memory name) external returns (bytes32);

  function openar_MapSystem_claimMap(bytes32 gameId) external returns (bytes32);
}