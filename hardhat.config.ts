import '@typechain/hardhat';
import 'dotenv/config';
import { HardhatUserConfig } from 'hardhat/types';

const HARDHAT_ENABLE_SENTRY = false;
const mnemonic = 'test test test test test test test test test test test junk';

const config: HardhatUserConfig = {
  solidity: {
    version: '0.8.0',
    settings: {
      metadata: {
        bytecodeHash: 'none',
      },
      optimizer: {
        enabled: false,
        runs: 200,
        details: {
          yul: false,
        },
      },
    },
 }
};
export default config;
