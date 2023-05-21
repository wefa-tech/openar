// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Match")));
bytes32 constant MatchTableId = _tableId;

struct MatchData {
  uint8[9] board;
  bytes32[2] players;
  address winner;
  bool trophyClaimed;
  bytes32 currentPlayer;
  uint8 turnCount;
}

library Match {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](6);
    _schema[0] = SchemaType.UINT8_ARRAY;
    _schema[1] = SchemaType.BYTES32_ARRAY;
    _schema[2] = SchemaType.ADDRESS;
    _schema[3] = SchemaType.BOOL;
    _schema[4] = SchemaType.BYTES32;
    _schema[5] = SchemaType.UINT8;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](6);
    _fieldNames[0] = "board";
    _fieldNames[1] = "players";
    _fieldNames[2] = "winner";
    _fieldNames[3] = "trophyClaimed";
    _fieldNames[4] = "currentPlayer";
    _fieldNames[5] = "turnCount";
    return ("Match", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get board */
  function getBoard(bytes32 key) internal view returns (uint8[9] memory board) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return toStaticArray_uint8_9(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint8());
  }

  /** Get board (using the specified store) */
  function getBoard(IStore _store, bytes32 key) internal view returns (uint8[9] memory board) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return toStaticArray_uint8_9(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint8());
  }

  /** Set board */
  function setBoard(bytes32 key, uint8[9] memory board) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 0, EncodeArray.encode(fromStaticArray_uint8_9(board)));
  }

  /** Set board (using the specified store) */
  function setBoard(IStore _store, bytes32 key, uint8[9] memory board) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 0, EncodeArray.encode(fromStaticArray_uint8_9(board)));
  }

  /** Get the length of board */
  function lengthBoard(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of board (using the specified store) */
  function lengthBoard(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of board (unchecked, returns invalid data if index overflows) */
  function getItemBoard(bytes32 key, uint256 _index) internal view returns (uint8) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 1, (_index + 1) * 1);
    return (uint8(Bytes.slice1(_blob, 0)));
  }

  /** Get an item of board (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemBoard(IStore _store, bytes32 key, uint256 _index) internal view returns (uint8) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 1, (_index + 1) * 1);
    return (uint8(Bytes.slice1(_blob, 0)));
  }

  /** Push an element to board */
  function pushBoard(bytes32 key, uint8 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /** Push an element to board (using the specified store) */
  function pushBoard(IStore _store, bytes32 key, uint8 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /** Pop an element from board */
  function popBoard(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 1);
  }

  /** Pop an element from board (using the specified store) */
  function popBoard(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.popFromField(_tableId, _keyTuple, 0, 1);
  }

  /** Update an element of board at `_index` */
  function updateBoard(bytes32 key, uint256 _index, uint8 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 1, abi.encodePacked((_element)));
  }

  /** Update an element of board (using the specified store) at `_index` */
  function updateBoard(IStore _store, bytes32 key, uint256 _index, uint8 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.updateInField(_tableId, _keyTuple, 0, _index * 1, abi.encodePacked((_element)));
  }

  /** Get players */
  function getPlayers(bytes32 key) internal view returns (bytes32[2] memory players) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return toStaticArray_bytes32_2(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get players (using the specified store) */
  function getPlayers(IStore _store, bytes32 key) internal view returns (bytes32[2] memory players) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return toStaticArray_bytes32_2(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set players */
  function setPlayers(bytes32 key, bytes32[2] memory players) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 1, EncodeArray.encode(fromStaticArray_bytes32_2(players)));
  }

  /** Set players (using the specified store) */
  function setPlayers(IStore _store, bytes32 key, bytes32[2] memory players) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 1, EncodeArray.encode(fromStaticArray_bytes32_2(players)));
  }

  /** Get the length of players */
  function lengthPlayers(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 1, getSchema());
    return _byteLength / 32;
  }

  /** Get the length of players (using the specified store) */
  function lengthPlayers(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 1, getSchema());
    return _byteLength / 32;
  }

  /** Get an item of players (unchecked, returns invalid data if index overflows) */
  function getItemPlayers(bytes32 key, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 1, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get an item of players (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemPlayers(IStore _store, bytes32 key, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 1, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Push an element to players */
  function pushPlayers(bytes32 key, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _keyTuple, 1, abi.encodePacked((_element)));
  }

  /** Push an element to players (using the specified store) */
  function pushPlayers(IStore _store, bytes32 key, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.pushToField(_tableId, _keyTuple, 1, abi.encodePacked((_element)));
  }

  /** Pop an element from players */
  function popPlayers(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _keyTuple, 1, 32);
  }

  /** Pop an element from players (using the specified store) */
  function popPlayers(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.popFromField(_tableId, _keyTuple, 1, 32);
  }

  /** Update an element of players at `_index` */
  function updatePlayers(bytes32 key, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _keyTuple, 1, _index * 32, abi.encodePacked((_element)));
  }

  /** Update an element of players (using the specified store) at `_index` */
  function updatePlayers(IStore _store, bytes32 key, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.updateInField(_tableId, _keyTuple, 1, _index * 32, abi.encodePacked((_element)));
  }

  /** Get winner */
  function getWinner(bytes32 key) internal view returns (address winner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Get winner (using the specified store) */
  function getWinner(IStore _store, bytes32 key) internal view returns (address winner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Set winner */
  function setWinner(bytes32 key, address winner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((winner)));
  }

  /** Set winner (using the specified store) */
  function setWinner(IStore _store, bytes32 key, address winner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((winner)));
  }

  /** Get trophyClaimed */
  function getTrophyClaimed(bytes32 key) internal view returns (bool trophyClaimed) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Get trophyClaimed (using the specified store) */
  function getTrophyClaimed(IStore _store, bytes32 key) internal view returns (bool trophyClaimed) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Set trophyClaimed */
  function setTrophyClaimed(bytes32 key, bool trophyClaimed) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 3, abi.encodePacked((trophyClaimed)));
  }

  /** Set trophyClaimed (using the specified store) */
  function setTrophyClaimed(IStore _store, bytes32 key, bool trophyClaimed) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 3, abi.encodePacked((trophyClaimed)));
  }

  /** Get currentPlayer */
  function getCurrentPlayer(bytes32 key) internal view returns (bytes32 currentPlayer) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get currentPlayer (using the specified store) */
  function getCurrentPlayer(IStore _store, bytes32 key) internal view returns (bytes32 currentPlayer) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4);
    return (Bytes.slice32(_blob, 0));
  }

  /** Set currentPlayer */
  function setCurrentPlayer(bytes32 key, bytes32 currentPlayer) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 4, abi.encodePacked((currentPlayer)));
  }

  /** Set currentPlayer (using the specified store) */
  function setCurrentPlayer(IStore _store, bytes32 key, bytes32 currentPlayer) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 4, abi.encodePacked((currentPlayer)));
  }

  /** Get turnCount */
  function getTurnCount(bytes32 key) internal view returns (uint8 turnCount) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 5);
    return (uint8(Bytes.slice1(_blob, 0)));
  }

  /** Get turnCount (using the specified store) */
  function getTurnCount(IStore _store, bytes32 key) internal view returns (uint8 turnCount) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 5);
    return (uint8(Bytes.slice1(_blob, 0)));
  }

  /** Set turnCount */
  function setTurnCount(bytes32 key, uint8 turnCount) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 5, abi.encodePacked((turnCount)));
  }

  /** Set turnCount (using the specified store) */
  function setTurnCount(IStore _store, bytes32 key, uint8 turnCount) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 5, abi.encodePacked((turnCount)));
  }

  /** Get the full data */
  function get(bytes32 key) internal view returns (MatchData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (MatchData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    bytes32 key,
    uint8[9] memory board,
    bytes32[2] memory players,
    address winner,
    bool trophyClaimed,
    bytes32 currentPlayer,
    uint8 turnCount
  ) internal {
    bytes memory _data = encode(board, players, winner, trophyClaimed, currentPlayer, turnCount);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    bytes32 key,
    uint8[9] memory board,
    bytes32[2] memory players,
    address winner,
    bool trophyClaimed,
    bytes32 currentPlayer,
    uint8 turnCount
  ) internal {
    bytes memory _data = encode(board, players, winner, trophyClaimed, currentPlayer, turnCount);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 key, MatchData memory _table) internal {
    set(key, _table.board, _table.players, _table.winner, _table.trophyClaimed, _table.currentPlayer, _table.turnCount);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 key, MatchData memory _table) internal {
    set(
      _store,
      key,
      _table.board,
      _table.players,
      _table.winner,
      _table.trophyClaimed,
      _table.currentPlayer,
      _table.turnCount
    );
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (MatchData memory _table) {
    // 54 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 54));

    _table.winner = (address(Bytes.slice20(_blob, 0)));

    _table.trophyClaimed = (_toBool(uint8(Bytes.slice1(_blob, 20))));

    _table.currentPlayer = (Bytes.slice32(_blob, 21));

    _table.turnCount = (uint8(Bytes.slice1(_blob, 53)));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 54) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 86;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.board = toStaticArray_uint8_9(SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint8());

      _start = _end;
      _end += _encodedLengths.atIndex(1);
      _table.players = toStaticArray_bytes32_2(SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    uint8[9] memory board,
    bytes32[2] memory players,
    address winner,
    bool trophyClaimed,
    bytes32 currentPlayer,
    uint8 turnCount
  ) internal view returns (bytes memory) {
    uint40[] memory _counters = new uint40[](2);
    _counters[0] = uint40(board.length * 1);
    _counters[1] = uint40(players.length * 32);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return
      abi.encodePacked(
        winner,
        trophyClaimed,
        currentPlayer,
        turnCount,
        _encodedLengths.unwrap(),
        EncodeArray.encode(fromStaticArray_uint8_9(board)),
        EncodeArray.encode(fromStaticArray_bytes32_2(players))
      );
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 key) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}

function toStaticArray_uint8_9(uint8[] memory _value) pure returns (uint8[9] memory _result) {
  // in memory static arrays are just dynamic arrays without the length byte
  assembly {
    _result := add(_value, 0x20)
  }
}

function toStaticArray_bytes32_2(bytes32[] memory _value) pure returns (bytes32[2] memory _result) {
  // in memory static arrays are just dynamic arrays without the length byte
  assembly {
    _result := add(_value, 0x20)
  }
}

function fromStaticArray_uint8_9(uint8[9] memory _value) view returns (uint8[] memory _result) {
  _result = new uint8[](9);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 288);
}

function fromStaticArray_bytes32_2(bytes32[2] memory _value) view returns (bytes32[] memory _result) {
  _result = new bytes32[](2);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 64);
}

function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
