import { foundry } from "@wagmi/chains";
import { MUDChain, latticeTestnet } from "@latticexyz/common/chains";

// If you are deploying to chains other than anvil or Lattice testnet, add them here
export const supportedChains: MUDChain[] = [foundry, latticeTestnet];
