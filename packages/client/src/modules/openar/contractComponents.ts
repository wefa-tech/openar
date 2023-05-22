/* Autogenerated file. Do not edit manually. */

import { TableId } from "@latticexyz/utils";
import { defineComponent, Type as RecsType, World } from "@latticexyz/recs";

export function defineContractComponents(world: World) {
  return {
    State: (() => {
      const tableId = new TableId("openar", "State");
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
      const tableId = new TableId("openar", "Identity");
      return defineComponent(
        world,
        {
          name: RecsType.String,
          description: RecsType.String,
          image: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Space: (() => {
      const tableId = new TableId("openar", "Space");
      return defineComponent(
        world,
        {
          position: RecsType.Number,
          value: RecsType.StringArray,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Grid: (() => {
      const tableId = new TableId("openar", "Grid");
      return defineComponent(
        world,
        {
          value: RecsType.NumberArray,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Map: (() => {
      const tableId = new TableId("openar", "Map");
      return defineComponent(
        world,
        {
          value: RecsType.String,
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
      const tableId = new TableId("openar", "Counter");
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