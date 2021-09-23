// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
require("jquery");

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("packs/library/photorotator");
require("packs/library/moment");
require("packs/library/moment-timezone-with-data-2012-2022");
require("packs/library/jquery.textfill.min");
require("packs/library/jquery.focuspoint");
require("packs/library/production");
