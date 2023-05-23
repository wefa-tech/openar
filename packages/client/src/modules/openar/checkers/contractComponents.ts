/* Autogenerated file. Do not edit manually. */

import { TableId } from "@latticexyz/utils";
import { defineComponent, Type as RecsType, World } from "@latticexyz/recs";

export function defineContractComponents(world: World) {
  return {
    Role: (() => {
      const tableId = new TableId("checkers", "Role");
      return defineComponent(
        world,
        {
          value: RecsType.Number,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Identity: (() => {
      const tableId = new TableId("checkers", "Identity");
      return defineComponent(
        world,
        {
          name: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Game: (() => {
      const tableId = new TableId("checkers", "Game");
      return defineComponent(
        world,
        {
          turnCount: RecsType.Number,
          id: RecsType.String,
          currentPlayer: RecsType.String,
          winner: RecsType.String,
          players: RecsType.StringArray,
          board: RecsType.NumberArray,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Counter: (() => {
      const tableId = new TableId("checkers", "Counter");
      return defineComponent(
        world,
        {
          value: RecsType.Number,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
  };
}
