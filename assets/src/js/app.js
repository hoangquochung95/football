// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../scss/index.scss";
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
import "jquery"
import "jquery-migrate"
import "./aos"
import "./bootstrap-datepicker"
import "./bootstrap.min"
import "./jquery-3.2.1.min"

import "./jquery.animateNumber.min"
import "./jquery.easing.1.3"
import "./jquery.magnific-popup.min"
import "./jquery.stellar.min"
import "./jquery.waypoints.min"
import "./owl.carousel.min"
import "./scrollax.min"
import "./main"
// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
