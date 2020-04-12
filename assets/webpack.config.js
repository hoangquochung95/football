// const path = require("path");
// const glob = require("glob");
// const MiniCssExtractPlugin = require("mini-css-extract-plugin");
// const TerserPlugin = require("terser-webpack-plugin");
// const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");
// const CopyWebpackPlugin = require("copy-webpack-plugin");

// module.exports = (env, options) => ({
//   optimization: {
//     minimizer: [
//       new TerserPlugin({ cache: true, parallel: true, sourceMap: false }),
//       new OptimizeCSSAssetsPlugin({})
//     ]
//   },
//   entry: {
//     "./js/app.js": glob.sync("./vendor/**/*.js").concat(["./js/app.js"])
//   },
//   output: {
//     filename: "app.js",
//     path: path.resolve(__dirname, "../priv/static/js")
//   },
//   module: {
//     rules: [
//       {
//         test: /\.js$/,
//         exclude: /node_modules/,
//         use: {
//           loader: "babel-loader"
//         }
//       },
//       {
//         test: /\.(png|woff|woff2|otf|eot|ttf|svg)$/,
//         loader: "url-loader?limit=100000"
//       },
//       {
//         test: /\.css$/,
//         use: [{ loader: "style-loader" }, "css-loader"]
//       }
//     ]
//   },
//   plugins: [
//     new MiniCssExtractPlugin({ filename: "./css/[name].css", allChunks: true }),
//     new CopyWebpackPlugin([{ from: "static/", to: "../" }])
//   ]
// });
const config = require('./webpack/config');

module.exports = config;