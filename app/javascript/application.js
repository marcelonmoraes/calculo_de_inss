// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import "./custom";
import "@nathanvda/cocoon";
import * as bootstrap from "bootstrap";
import { Chart } from "chart.js";

window.Chart = Chart;
