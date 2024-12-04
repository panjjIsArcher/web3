import { override, addWebpackResolve } from "customize-cra";
module.exports = override(
  addWebpackResolve({
    fallback: {
      url: false,
      os: false,
      console: false,
    },
  })
);
