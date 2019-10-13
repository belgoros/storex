// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import $ from 'jquery'

require   ('what-input');
window.$ = $;


import Foundation from 'foundation-sites';
$(document).foundation();

import css from "../css/app.scss"
import "phoenix_html"
