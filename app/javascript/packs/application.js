// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
require("jquery");
require("moment");

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("packs/library/jquery-ui-1.12.1.custom.min");

require("packs/library/moment-timezone-with-data-2012-2022");
require("packs/library/photorotator");
require("packs/library/photoswipe-init");
require("packs/library/photoswipe-ui-default");
require("packs/library/photoswipe");
require("packs/library/production");
require("packs/library/hammer.min");