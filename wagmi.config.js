import { hardhat } from "@wagmi/cli/plugins";
import { defineConfig, react } from "@wagmi/cli";

/** @type {import('@wagmi/cli').Config} */
export default defineConfig({
  out: "src/generated.js",
  contracts: [], // 合约列表
  plugins: [
    hardhat({
      project: "./",
      commands: {
        clean: "pnpm hardhat clean",
        build: "pnpm hardhat compile",
        rebuild: "pnpm hardhat compile",
      },
    }),
    react(), // 自动生成合约挂钩，简化前端代码
  ],
});
