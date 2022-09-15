var prod = {};

prod.navCollapsibleClick = function (collapsible) {
  collapsible.toggleClass("navCollapsed");
  collapsible.find("> ul").slideToggle();
  //when opening, close open siblings
  if (!collapsible.hasClass("navCollapsed")) {
    collapsible
      .siblings(".navCollapsible:not(.navCollapsed)")
      .each(function () {
        $ec(this).toggleClass("navCollapsed");
        $ec(this).find("> ul").slideToggle();
      });
  }
};
prod.navCollapsibleOpenSelected = function (nav) {
  //modify this on closing mobile panel so user doesn't see animation when opening
  if (!$ec("body").hasClass("mobilePanelActive")) {
    nav.find(".sideNavSelected.navCollapsed").each(function () {
      //open all selected collapsible pages and groups
      //this also closes the non-selected ones by consequence
      prod.navCollapsibleClick($ec(this));
    });
    nav
      .find(".navCollapsible:not(.navCollapsed):not(.sideNavSelected)")
      .each(function () {
        //close any child collapsibles that aren't selected
        prod.navCollapsibleClick($ec(this));
      });
  }
};

prod.error = function (handler) {
  return function (jqXHR, status, error) {
    if (status != "success") {
      //sometimes error is incorrectly called, when it is a success
      if (error == "Internal Server Error" || jqXHR.status == 500) {
        //This was likely an exception that we formatted
        var html = $ec.parseHTML(jqXHR.responseText.trim());
        var text = "Unknown";
        $ec.each(html, function () {
          if ($ec(this).find(".errorMessage").length > 0) {
            text = $ec(this).find(".errorMessage").html();
          }
        });
        handler("ERROR: " + text);
      } else {
        alert(
          "There was an error communicating with the server:" +
            status +
            ": " +
            error
        );
      }
    }
  };
};

prod.checkMegaMenus = function () {
  var listMegaMenu = $ec(".megaMenu");
  listMegaMenu.each(function (index, element) {
    var ulM = $ec(element).find(">ul");
    ulM.css("display", "block"); //Needs to have a position
    var linkWidth = parseInt(ulM.find(">li").css("width"));
    var leftGroupObj = ulM.find(">li:first-child");
    if (leftGroupObj.length) {
      var leftGroup = leftGroupObj.offset().left;
      var rightGroup = ulM.find(">li:last-child").offset().left + linkWidth;
      var diffGroup = rightGroup - leftGroup;
      var diffSpace = ulM.width(); //does not include padding
      ulM.css("display", "");

      var colSize = parseInt(ulM.css("column-count"));
      while (diffGroup <= diffSpace - linkWidth && colSize > 0) {
        colSize = colSize - 1;
        diffSpace = diffSpace - linkWidth;
      }
      ulM.css("column-count", colSize);
      ulM.css("-moz-column-count", colSize);
      ulM.css("-webkit-column-count", colSize);
    }
  });
};

prod.setOrigSiteWidth = function () {
  prod.origSiteWidth = $ec("#siteWidthIndicator").width();
};
prod.checkMobile = function (isInitialSetup) {
  //the sizeContentDivs stuff needs to run after the core sizing the first time the page loads
  if (prod.isMobile()) {
    if (!isInitialSetup) {
      if ($ec("html.oldie").length == 0) {
        //disable core resizing for ie9 and earlier
        prod.removeSizeContentDivs();
        prod.setFooterHeight();
      }
      prod.setOrigSiteWidth();
      //set up tabs sections when switching from desktop to mobile
      prod.tabsToAccordion();
    }
    if (
      $ec(".slideshowModule.vimeoMode").length > 0 &&
      !$ec(".slideshowModule.vimeoMode").hasClass("playerControlsOn")
    ) {
      //Show controls on mobile
      if ($ec("#vimeoDesktop").attr("src").indexOf("&controls=0") !== -1) {
        $ec("#vimeoDesktop").attr(
          "src",
          $ec("#vimeoDesktop").attr("src").replace("&controls=0", "")
        );
      }
    }
    prod.checkMobileSmallColumn();
    prod.fixSectionHeights();
    if (!isInitialSetup) {
      prod.reinitFocusPoint();
    }
  } else {
    if (!isInitialSetup) {
      if ($ec("html.oldie").length == 0) {
        //disable core resizing for ie9 and earlier
        prod.sizeContentDivs();
        prod.setFooterHeight();
      }
      //set up tabs sections when switching from mobile to desktop
      prod.accordionToTabs();
      prod.reinitFocusPoint();
    }
    if (
      $ec(".slideshowModule.vimeoMode").length > 0 &&
      !$ec(".slideshowModule.vimeoMode").hasClass("playerControlsOn")
    ) {
      //Hide controls on desktop
      if ($ec("#vimeoDesktop").attr("src").indexOf("&controls=0") == -1) {
        $ec("#vimeoDesktop").attr(
          "src",
          $ec("#vimeoDesktop").attr("src") + "&controls=0"
        );
      }
    }
    if (prod.sticky) {
      prod.initNavSticky();
    }
    //Undo prod.fixSectionHeights(); for resize buttons
    $ec(
      ".sectionRegion .sectionButtonModule:not(.sectionButtonMarkedDelete)"
    ).removeAttr("style");
  }
  if (prod.hasMobileNav()) {
    prod.setupMobilePanel();
  } else {
    prod.removeMobilePanel();
  }
  prod.resizeModules($ec("body"));
};

// Whether mobile width or not
prod.isMobile = function () {
  var mobileIndicatorWidth = $ec("#mobileIndicator").width();
  return mobileIndicatorWidth > 0;
};

// Mobile nav can be visible on desktop
prod.hasMobileNav = function () {
  var navIconWidth = $ec("#navicon").width();
  return navIconWidth > 0;
};

prod.mobilePanel = function () {
  try {
    $ec("#background")
      .get(0)
      .addEventListener("click", prod.backgroundClickFunction, true);
  } catch (e) {
    // TODO add handler (but why would the above call fail?)
  }
};

prod.removeMobilePanel = function () {
  var nav = $ec("#nav");
  nav.removeClass("mobile");
  try {
    $ec("#background")
      .get(0)
      .removeEventListener("click", prod.backgroundClickFunction);
  } catch (e) {
    // TODO add handler (but why would the above call fail?)
  }
};

prod.isMobileSetup = false;
prod.setupMobilePanel = function () {
  if (!prod.isMobileSetup) {
    prod.isMobileSetup = true;
    if (prod.isMobile()) {
      prod.removeNavSticky();
    }

    //copy header elements to the mobile panel
    var panel = $ec("#mobilePanel");
    var search = $ec("#search").clone();
    search.attr("id", "mobileSearch");
    prod.initSearch(search.find(".searchBox"));
    prod.initSearchBoxSubmit(search.find(".searchBoxSubmit"));
    panel.append(search);
    var qls = $ec("#quickLinks").clone();
    qls.attr("id", "mobileQuickLinks");
    panel.append(qls);
    //mobile nav - move to end
    var nav = $ec("#mobileNav");
    panel.append(nav);

    //create function to be executed on background click
    prod.backgroundClickFunction = function (e) {
      if ($ec("body").hasClass("mobilePanelActive") && prod.hasMobileNav()) {
        //navicon should always close mobile panel
        //on mobile, clicking a background element that is outside of the mobile panel should close mobile panel
        if (
          (e.target.id === "#navicon" ||
            (prod.isMobile() &&
              $ec(e.target).parents("#mobilePanel").length === 0)) &&
          !$ec(e.target).parents("#socialMediaBody").length
        ) {
          $ec("body").toggleClass("mobilePanelActive");
          prod.navCollapsibleOpenSelected($ec("#mobileNav"));
          e.preventDefault();
          e.stopPropagation();
        }
      }
    };

    prod.mobilePanel();
  } else {
    prod.mobilePanel();
  }
};

prod.checkMobileSmallColumn = function () {
  //if side nav is only module in column and is hidden on mobile, then hide column
  var modules = $ec("#content2 > li");
  if (modules.length == 1) {
    if (!modules.first().is(":visible")) {
      $ec("#content2").addClass("hideMobileColumn");
    }
  }
};

prod.resizeNav = function (secondRun) {
  if (!prod.noResize) {
    if ($ec("#nav").width() <= 5 || $ec("#nav").height() <= 5) {
      //[DEV-549] - Otherwise runs infinitely
      $ec(window).on("load", function () {
        prod.resizeNav(secondRun);
      });
    } else {
      $ec("#nav").removeClass("resize");
      for (var i = $ec("#nav > ul > li").length - 1; i >= 0; i--) {
        if ($ec("#nav").width() < $ec("#nav > ul").width()) {
          $ec($ec("#nav > ul > li").get(i)).hide();
          $ec("#sideTabNav").addClass("navDropped");
        } else {
          break;
        }
      }
      $ec("#nav").addClass("resize");
    }
    if (!secondRun) {
      $ec("#nav > ul > li").hover(function () {
        var submenu = $ec(this).children("ul");
        var width = submenu.outerWidth() + $ec(this).position().left;
        var moveLeft = $ec("#nav").width() - width;
        if (moveLeft > 0) {
          moveLeft = "0px";
        }
        submenu.css({ marginLeft: moveLeft });
      });
      //Rerun after fonts have loaded
      $ec(window).on("load", function () {
        var hiddenItems = $ec("#nav > ul > li");
        if (hiddenItems.length > 0) {
          hiddenItems.show();
        }
        prod.resizeNav(true);
      });
    }
  }
};

prod.initNavSticky = function () {
  prod.removeNavSticky();
  var adminBarHeight = 0;
  if (
    $ec("#background.admin").length ||
    $ec("body.preview.showPreviewToolbar").length
  ) {
    if ($ec("#adminToolbar").length) {
      adminBarHeight += $ec("#adminToolbar").height();
    }
    if ($ec("#adminMessage").length) {
      adminBarHeight += $ec("#adminMessage").height();
    }
  }
  prod.stickyNavTop = $ec("#nav").offset().top - adminBarHeight;
  prod.origStickyNavTop = parseInt($ec("#nav").css("top"));
  $ec(window).scroll(prod.updateNavSticky);
  prod.updateNavSticky();
};
prod.updateNavSticky = function () {
  var scrollTop = $ec(window).scrollTop();
  var navBar = $ec("#nav").width();

  if (scrollTop > prod.stickyNavTop) {
    var windowOffset = parseInt($ec("#background").css("border-top-width"));
    //position on the top
    $ec("#nav").css("position", "fixed");
    $ec("#nav").css("top", windowOffset + "px");
    $ec("#nav").css("left", "50%");
    $ec("#nav").css("margin-left", "-" + navBar / 2 + "px");
    $ec("#navBackground").css("position", "fixed");
    $ec("#navBackground").css("top", windowOffset + "px");
    $ec("#navBackground").addClass("navSticky");
  } else {
    //original value
    $ec("#nav").css("position", "absolute");
    $ec("#nav").css("top", prod.stickyNavTop + "px");
    $ec("#navBackground").css("position", "absolute");
    $ec("#navBackground").css("top", prod.stickyNavTop + "px");
    $ec("#navBackground").removeClass("navSticky");
  }
};
prod.removeNavSticky = function () {
  $ec("#nav").css("position", "");
  $ec("#nav").css("top", "");
  $ec("#nav").css("left", "");
  $ec("#nav").css("margin-left", "");
  $ec("#navBackground").css("position", "");
  $ec("#navBackground").css("top", "");
};
prod.setFooterHeight = function () {
  var footerHeight = $ec("#footerBackground").outerHeight(true);
  if (document.getElementById("background") != null) {
    var pseudoAfterHeight = parseInt(
      window
        .getComputedStyle(document.getElementById("background"), ":after")
        .getPropertyValue("height")
    ); //getting height of pseudo element - https://stackoverflow.com/a/44912365/8821716
    if (footerHeight != pseudoAfterHeight) {
      //avoid adding to <head> if the value hasn't changed
      $ec("head").append(
        "<style>#background:after{height:" + footerHeight + "px}</style>"
      ); //generated content is not in the DOM so jquery can't touch it - you need to insert CSS to change it
    }
  }
};
prod.sizeCore = function () {
  var core = $ec("#core");

  // FIXME the administration page doesn't have a core; do we need to be doing any resizing that may be getting skipped because of this?
  if (!core.length || core.hasClass("section")) {
    return;
  }

  var footer = $ec("#footer");
  //coreBottom: height and bottom margin (include margin then subtract margin top to avoid duplication)
  var coreBottom =
    core.offset().top +
    core.outerHeight(true) -
    core.css("margin-top").replace("px", "");
  var footerBottom = footer.offset().top;
  var diff = footerBottom - coreBottom;
  // stick height to at least 10px if there's little or no content
  var newHeight = core.height() + diff;
  if (newHeight < 50) {
    core.css("min-height", 50);
  } else {
    core.css("min-height", newHeight);
  }
};
//section region module heights on mobile need to be fixed to preserve visible content
prod.fixSectionHeights = function () {
  var sectionRegion = $ec(".sectionRegion");

  if (!sectionRegion.length) {
    return;
  }

  //for fixed height sections, calculate and set height of modules
  sectionRegion
    .find(".sectionInner.hasFixedHeight:not(.buttonsSection)")
    .each(function () {
      var height = $ec(this)[0].style.height.replace("px", "");
      if (height == 0) {
        var sectionClone = $ec(this)
          .clone()
          .insertAfter($ec(this))
          .css("width", prod.origSiteWidth)
          .addClass("clonedMobileSection");
        height = sectionClone.height();
        sectionClone.remove();
      }

      //create temporary clones of header and footer and make full width to calculate their height on desktop
      //classes added for mobile styling exclusion
      var headerClone = $ec(this)
        .find("> header")
        .clone()
        .appendTo($ec(this))
        .css("width", prod.origSiteWidth)
        .addClass("clonedMobileHeader");
      var headerHeight = headerClone.outerHeight();
      headerClone.remove();
      var footerClone = $ec(this)
        .find("> footer")
        .clone()
        .appendTo($ec(this))
        .css("width", prod.origSiteWidth)
        .addClass("clonedMobileFooter");
      var footerHeight = footerClone.outerHeight();
      footerClone.remove();

      height = height - headerHeight - footerHeight;
      $ec(this)
        .find(".modulePosition > li")
        .each(function () {
          var moduleInner = $ec(this).find(".moduleInner");
          if (!moduleInner.is(".markedDelete, .buttonModule")) {
            $ec(this).css("height", height);
          }
        });
    });

  //for section button modules, calculate and set height of modules
  sectionRegion.find(".sectionInner").each(function () {
    var section = $ec(this);
    if (
      section.find(".sectionButtonModule:not(.sectionButtonMarkedDelete)")
        .length
    ) {
      //create temporary clone of section and make full width to calculate its height on desktop
      //class added for mobile styling exclusion
      var sectionClone = section
        .clone()
        .css("width", prod.origSiteWidth)
        .addClass("clonedMobileSection")
        .insertAfter(section);
      section
        .find(".sectionButtonModule:not(.sectionButtonMarkedDelete)")
        .each(function () {
          var clonedItem = sectionClone
            .find("#" + $ec(this).attr("id"))
            .removeAttr("style")
            .parent();
          var desktopHeight = clonedItem.innerHeight();
          var desktopWidth = clonedItem.innerWidth();
          var maxWidth = $ec(this).closest(".sectionBody").innerWidth();
          if (desktopWidth > maxWidth) {
            $ec(this).css("width", desktopWidth);
            $ec(this).css(
              "transform",
              "scale(" + maxWidth / desktopWidth + ")"
            );
            $ec(this).css(
              "margin-left",
              ($ec(this).parent().innerWidth() - maxWidth) / 2
            );
            $ec(this).css(
              "margin-top",
              desktopHeight * (maxWidth / desktopWidth - 1)
            );
          } else {
            $ec(this).removeAttr("style");
          }
          $ec(this).css("height", desktopHeight);
        });
      sectionClone.remove();
    }
  });
};
prod.sizeContentDivs = function () {
  var core = $ec("#core");

  // FIXME the administration page doesn't have a core; do we need to be doing any resizing that may be getting skipped because of this?
  if (!core.length || core.hasClass("section")) {
    return;
  }

  var contents = $ec("#content1, #content2, #content3, #section1");
  var bottomHorizontals = $ec("#bottomHorizontal1, #bottomHorizontal2");
  //coreBottom: height and padding/border on only the top (include it all and subtract off the bottom)
  var coreBottom =
    core.offset().top +
    core.outerHeight() -
    core.css("padding-bottom").replace("px", "") -
    core.css("border-bottom-width").replace("px", "");
  var bottomHorizontalHeight = 0;
  bottomHorizontals.each(function () {
    var bottomHorizontal = $ec(this);
    bottomHorizontalHeight += bottomHorizontal.outerHeight(true);
  });
  contents.each(function () {
    var content = $ec(this);
    //contentbottom: height and bottom margin (include margin then subtract margin top to avoid duplication)
    var contentbottom =
      content.offset().top +
      content.outerHeight(true) -
      content.css("margin-top").replace("px", "");
    var diff = coreBottom - contentbottom - bottomHorizontalHeight;
    // stick height to at least 10px if there's little or no content
    var newHeight = content.outerHeight() + diff;
    if (newHeight < 50) {
      content.css("min-height", 50);
    } else {
      content.css("min-height", newHeight);
    }
  });
};
prod.removeSizeContentDivs = function () {
  var contents = $ec("#content1, #content2, #content3, #section1");
  contents.css("min-height", "");
};

prod.initModules = function (selector) {
  prod.initMail(selector.find(".mail"));
  prod.initSlideshow();
  prod.initSearch($ec(".searchBox"));
  prod.initSearchBoxSubmit($ec(".searchBoxSubmit"));
  prod.initSearchPopup();
  prod.initEventLocation(selector.find(".locationNameButton"));
  prod.initInfoButtons();
  selector.find(".eCatholicLiveCountdownModule").each(function () {
    prod.initLiveCountdown($ec(this));
  });
  prod.initDynamicThumbs(selector);
  selector.find(".tabsSection").each(function () {
    prod.initTabsSection($ec(this));
  });
  selector.find(".focusPointImage").each(function () {
    prod.initFocusPoint($ec(this));
  });
};
prod.initInfoButtons = function () {
  prod.activateInfo($ec(".infoHolder"));
};
prod.calendarButtonLock = false;

prod.initMail = function (selector) {
  selector.mouseenter(function () {
    var $this = $ec(this);
    var localMail = $this.find(".localMail").html();
    var domainMail = $this.find(".domainMail").html();
    $this.attr("href", "mailto:" + localMail + "@" + domainMail);
  });
};
prod.initSlideshow = function () {
  var slideshow = $ec(".slideshowModule");
  if (slideshow.hasClass("broadcastOn")) {
    var time = slideshow.find(".broadcastTime").html();
    if (time && typeof moment !== "undefined") {
      //uses moment.js to handle timezones because js Date support is inconsistent
      //get broadcast time from module html in cms timezone
      var cmsTime = moment.tz(time, "America/Chicago");
      //convert broadcast time to browser's timezone
      var broadcastTime = cmsTime.tz(moment.tz.guess()).toDate();
      //calculate time remaining to broadcast and add ten second delay
      var now = moment().toDate();
      var timeToBroadcast = broadcastTime.getTime() - now.getTime();
      timeToBroadcast += 10000;

      //if less than a day away, set timer to replace slideshow with player - very large numbers can cause an exception that replaces the slideshow immediately
      if (timeToBroadcast > 0 && timeToBroadcast < 86400000) {
        setTimeout(function () {
          //replace the slideshow with the player iframe
          var embed = slideshow.find(".broadcastEmbed").html();
          if (embed) {
            slideshow.addClass("broadcasting");
            slideshow.find("#rotator").hide();
            slideshow.find(".moduleBody").hide();
            embed = embed.replace(/&lt;/g, "<").replace(/&gt;/g, ">");
            $ec("<div class='moduleBody livePlayerContainer'></div>")
              .html(embed)
              .appendTo(slideshow);
            prod.resizeModules(slideshow);
          } else {
            //fallback to refreshing the page
            location.reload(true);
          }
        }, timeToBroadcast);
      }
    }
  }
  if (slideshow.hasClass("videoMode")) {
    slideshow.parent().parent().addClass("hasVideo");
    if (slideshow.hasClass("captionOn")) {
      slideshow.parent().parent().addClass("hasVideoCaption");
    }
    prod.resizeModules(slideshow);
    prod.resizeWidthAndHeight(slideshow.find(".captionPositioner"));
    if (slideshow.hasClass("vimeoMode")) {
      if (typeof Vimeo != "undefined") {
        if (slideshow.hasClass("autoplayOn")) {
          var video = $ec("#vimeoDesktop");
          var player = new Vimeo.Player(video[0]);
          player.setVolume(0); //mute fallback for videos from free Vimeo accounts
        } else {
          if (!slideshow.hasClass("playerControlsOn")) {
            var video = slideshow.find("#vimeoDesktop");
            var overlay = slideshow.find("#vimeoBlocker");
            var player = new Vimeo.Player(video);
            player.ready().then(function () {
              $ec(overlay)
                .off()
                .on("click", function () {
                  player.getPaused().then(function (paused) {
                    if (paused) {
                      player.play();
                      overlay.removeClass("play");
                      overlay.addClass("pause");
                    } else {
                      player.pause();
                      overlay.removeClass("pause");
                      overlay.addClass("play");
                    }
                  });
                });
            });
          }
        }
      }
    }
    if (slideshow.hasClass("callToActionOn")) {
      prod.initializeSVG($ec("#featureSlideshow .callToActionArrow"));
    }
  } else if (typeof Rotator != "undefined") {
    slideshow.parent().parent().removeClass("hasVideo");
    prod.initializeSVG($ec("#featureSlideshow .callToActionArrow"));
  }
  //Load slideshow / gallery
  if ($ec(".rotator").length > 0) {
    var rotatorDivs = $ec(".rotator").each(function () {
      if (
        $ec(this).parent().find(".slideshowPhotoHolder").children().length > 0
      ) {
        //has the rotator been loaded?
        var slides = new Array();
        $ec(this)
          .parent()
          .find(".slideshowPhotoHolder")
          .each(function () {
            var slide = new Object();
            $this = $ec(this);
            if ($this.attr("additionalclass") != "") {
              slide.additionalclass = $this.attr("additionalclass");
            }
            slide.img = $this.find(".img").prop("href");
            if ($this.find(".srcset")) {
              slide.srcset = $this.find(".srcset").prop("href");
            }
            if ($this.find(".title")) {
              slide.title = $this.find(".title").html();
            }
            if ($this.find(".caption")) {
              slide.caption = $this.find(".caption").html();
            }
            if ($this.find(".callToAction")) {
              slide.callToAction = $this.find(".callToAction").html();
            }
            if ($this.find(".href")) {
              slide.href = $this.find(".href").text();
              if ($ec("body.preview").length) {
                slide.href = prod.createPreviewLink(slide.href);
              }
            }
            if ($this.find(".target")) {
              slide.target = $this.find(".target").html();
            }
            slides.push(slide);
            $this.remove();
          });
        var slideshowSettings = $ec(this).parent().find(".slideshowSettings");
        var timingSeconds = slideshowSettings.find(".timingSeconds").html();
        if (timingSeconds < 1) {
          timingSeconds = 1;
        }
        var effect = slideshowSettings.find(".effect").html();
        var myRotator = new Rotator(
          slides,
          timingSeconds,
          effect,
          100,
          $ec(this),
          "backBtn",
          "fwdBtn",
          "pauseBtn",
          "shortcuts",
          1,
          1
        );
      }
    });
  }
};
prod.resizeSiteName = function (siteName, failed) {
  var siteNameBody = siteName.find("#siteNameBody");
  if (siteNameBody.length === 0) {
    return;
  }
  var siteNameHeight = siteName.height();
  var siteNameLines = siteNameBody.find(".line1, .line2");
  var siteNameContainers = siteNameLines.children(".editText, a");
  if (!failed) {
    // Sometimes the old textfill data messes with the calculations
    siteNameBody.css("flex-wrap", "");
    siteNameLines.css("font-size", "");
    siteNameContainers.css("font-size", "");
  }
  var siteNameBodyHeight = siteNameBody.height();
  var siteNameLineWidth1,
    siteNameLineWidth2,
    siteNameLineHeight1,
    siteNameLineHeight2;
  if (siteNameBody.css("display").indexOf("flex") > -1) {
    if (siteNameBody.css("flex-direction") === "row") {
      siteNameLineWidth1 = siteNameBody.find(".line1").width();
      siteNameLineWidth2 = siteNameBody.find(".line2").width();
    } else if (siteNameBody.css("flex-direction") === "column") {
      siteNameBody.css("height", "100%");
      siteNameLineHeight1 = Math.floor(siteNameBody.find(".line1").height());
      siteNameLineHeight2 = Math.floor(siteNameBody.find(".line2").height());
    }
  } else if (siteNameBodyHeight > siteNameHeight) {
    siteNameLineHeight1 = siteNameBody.find(".line1").height();
    siteNameLineHeight2 = siteNameBody.find(".line2").height();
    siteNameBodySpacing = Math.max(
      siteNameBodyHeight - siteNameLineHeight1 - siteNameLineHeight2,
      0
    );
    siteNameLineHeight1 = Math.floor(
      (siteNameLineHeight1 / (siteNameBodyHeight - siteNameBodySpacing)) *
        (siteNameHeight - siteNameBodySpacing)
    );
    siteNameLineHeight2 = Math.floor(
      (siteNameLineHeight2 / (siteNameBodyHeight - siteNameBodySpacing)) *
        (siteNameHeight - siteNameBodySpacing)
    );
  }
  var failedSizing = false;
  siteNameLines.each(function () {
    var siteNameLine = $ec(this);
    var siteNameFontSize = parseFloat(siteNameLine.css("font-size"), 10); // base 10
    var explicitWidth = null;
    var explicitHeight = null;
    if (siteNameLineWidth1) {
      if (siteNameLine.hasClass("line1")) {
        explicitWidth = siteNameLineWidth1;
      } else {
        explicitWidth = siteNameLineWidth2;
      }
    } else if (siteNameLineHeight1) {
      if (siteNameLine.hasClass("line1")) {
        explicitHeight = siteNameLineHeight1;
      } else {
        explicitHeight = siteNameLineHeight2;
      }
    }
    siteNameLine.textfill({
      innerTag: ".editText, a",
      maxFontPixels: Math.max(siteNameFontSize, 12),
      minFontPixels: 10,
      explicitWidth: explicitWidth,
      explicitHeight: explicitHeight || siteNameHeight,
      changeLineHeight: true,
      fail: function () {
        if (!failed) {
          //An issue happened, set this to the minimum font-size and run again
          siteNameLine.css("font-size", 10);
          siteNameLine.children(".editText, a").css("font-size", 10);
          failedSizing = true;
        } else if (
          explicitWidth != null &&
          siteNameBody.css("flex-wrap") !== "wrap"
        ) {
          // Last ditch effort for inline items, set it to wrap
          siteNameBody.css("flex-wrap", "wrap");
          failedSizing = true;
        }
        // If this fails twice in a row, just keep the 10px font-size
      }
    });
    if (failedSizing) {
      prod.resizeSiteName(siteName, true);
      return false; // break out of this loop
    }
  });
};
prod.initSearch = function (element) {
  element.keyup(function (e) {
    if (e.keyCode == 13) {
      //enter key
      prod.search($ec(this));
    }
  });
};
prod.initSearchBoxSubmit = function (element) {
  element.click(function () {
    var searchBox = $ec(this).parent().children(".searchBox");
    prod.search(searchBox);
  });
};
prod.initSearchPopup = function (element) {
  $ec("#searchPopup").on("click", function (event) {
    $ec("#search").addClass("open");
    setTimeout(function () {
      $ec("#header #searchField").get(0).focus();
    }, 1000);
  });
  $ec("#search").on("click keyup", function (event) {
    if (event.target == this || event.keyCode == 27) {
      $ec(this).removeClass("open");
    }
  });
};
prod.search = function (element) {
  var val = element.val();
  if (val != "") {
    var baseUrl = $ec("body").attr("baseUrl");
    var url = baseUrl + "search?query=" + val;
    if (/[\?&]preview$/.test(window.location)) {
      url += "&preview";
    }
    window.location = url;
  }
};
prod.initEventLocation = function (selector) {
  $ec(".toggledLocationContent").hide();
  selector.click(function (e) {
    e.preventDefault();
    $ec(".toggledLocationContent").toggle();
  });
};
prod.initDynamicThumbs = function (selector) {
  selector
    .find(".dynamicThumbImage.load")
    .one("load", function () {
      var $this = $ec(this);
      var parent = $this.parents(".dynamicThumb");
      if (!parent.is(":visible")) {
        return;
      }
      $this.removeClass("load").show();
      var zoom = $this.attr("zoom");
      var width = $this.width() * (zoom - 0.015);
      var height = $this.height() * (zoom - 0.015);
      var posX = parseFloat($this.attr("posx"));
      var posY = parseFloat($this.attr("posy"));

      var finalWidth = parent.width();
      var finalHeight = parent.height();
      var finalZoom = zoom;
      var finalPosX = posX + 64 - finalWidth / 2;
      var finalPosY = posY + 64 - finalHeight / 2;

      if (width < finalWidth || height < finalHeight) {
        //get the more restrictive
        if (width / finalWidth > height / finalHeight) {
          finalZoom = finalHeight / $this.height();
          finalPosY = 0;
          finalPosX = (posX + 64) / width;
          width = finalZoom * $this.width();
          finalPosX = finalPosX * width - finalWidth / 2;
          if (finalPosX + finalWidth > width) {
            finalPosX = width - finalWidth;
          }
        } else {
          finalZoom = finalWidth / $this.width();
          finalPosX = 0;
          finalPosY = (posY + 64) / height;
          height = finalZoom * $this.height();
          finalPosY = finalPosY * height - finalHeight / 2;
          if (finalPosY + finalHeight > height) {
            finalPosY = height - finalHeight;
          }
        }
        width = finalZoom * $this.width();
        height = finalZoom * $this.height();
      } else {
        finalZoom = (Math.max(finalHeight, finalWidth) / 128) * zoom;
        finalPosX =
          (posX + 64) * (Math.max(finalHeight, finalWidth) / 128) -
          finalWidth / 2;
        finalPosY =
          (posY + 64) * (Math.max(finalHeight, finalWidth) / 128) -
          finalHeight / 2;
        width = finalZoom * $this.width();
        height = finalZoom * $this.height();
      }
      $this.css({
        left: "-" + (finalPosX / finalWidth) * 100 + "%",
        top: "-" + (finalPosY / finalHeight) * 100 + "%",
        width: (width / finalWidth) * 100 + "%",
        height: (height / finalHeight) * 100 + "%"
      });
    })
    .each(function () {
      //fires load event if image was cached
      if (this.complete) {
        $ec(this).trigger("load");
      }
    });
};
prod.initTabsSection = function (selector) {
  if (selector.hasClass("tabsView")) {
    prod.initTabsInSection(selector);
  } else {
    prod.initAccordionInSection(selector);
  }
  if (prod.isMobile()) {
    prod.tabsToAccordion();
  }
};
prod.initTabsInSection = function (selector) {
  var tabsBody = selector.find(".sectionBody");
  tabsBody.find(".focusPointImage").each(function () {
    prod.initFocusPoint($ec(this));
  });
  tabsBody.tabs({
    create: function (event, ui) {
      //if admin, switch height to min height to accommodate editing
      if (typeof admin != "undefined") {
        ui.panel.css("min-height", ui.panel.outerHeight());
        ui.panel.height("");
      }
      //remove class that overrides site link styling
      tabsBody.removeClass("ui-widget-content");
      tabsBody.find(".tabContent").removeClass("ui-widget-content");
    },
    activate: function (event, ui) {
      //when switching tabs, reload iframes to avoid videos playing in tabs that are not visible
      ui.oldPanel.find("iframe").each(function () {
        $ec(this).attr("src", $ec(this).attr("src"));
      });
      ui.newPanel.find(".focusPointImage").each(function () {
        prod.initFocusPoint($ec(this));
      });
      //if admin, update height then switch to min height to accommodate editing
      if (typeof admin != "undefined") {
        tabsBody.find(".tabContent").css("min-height", "");
        tabsBody.tabs("refresh");
        ui.newPanel.css("min-height", ui.newPanel.outerHeight());
        ui.newPanel.height("");
      }
      //resize any iframe modules that are now visible
      prod.resizeModules(ui.newPanel);
    },
    heightStyle: "auto"
  });
  //disable any tabs that are marked delete
  selector.find(".tabArea .tab.markedDelete").each(function () {
    tabsBody.tabs("disable", $ec(this).children(".name").attr("href"));
  });
  //activate the first enabled tab
  prod.activateFirstTab(tabsBody);
  //start auto-scroll if turned on
  if (tabsBody.hasClass("autoScrollOn")) {
    var autoScroll = setInterval(function () {
      prod.advanceTab(tabsBody);
    }, tabsBody.attr("data-timingSeconds") * 1000);
    tabsBody.attr("data-interval", autoScroll);
    //stop interval when interacting with tabs
    tabsBody.mousedown(function () {
      clearInterval(autoScroll);
    });
    tabsBody.find("iframe").hover(function () {
      clearInterval(autoScroll);
    });
  }
  //check url and open tab if tab id is present
  var hash = location.hash;
  if (hash.indexOf("tabContent_") >= 0) {
    var index = tabsBody
      .find('a[href="' + hash + '"]')
      .parent()
      .index();
    if (index >= 0) {
      clearInterval(tabsBody.attr("data-interval"));
      tabsBody.tabs("option", "active", index);
      prod.scrollTo(tabsBody.closest(".sectionInner"));
    }
  }
};
prod.activateFirstTab = function (tabsBody) {
  if (tabsBody.data("ui-tabs")) {
    var firstTab = tabsBody
      .find(".tabArea .tab:not(.markedDelete) .name")
      .first();
    var index = tabsBody
      .find('a[href="' + firstTab.attr("href") + '"]')
      .parent()
      .index();
    tabsBody.tabs("option", "active", index);
  }
};
prod.initAccordionInSection = function (selector) {
  var tabsBody = selector.find(".sectionBody");
  var active = tabsBody.hasClass("openFirstAccordion") ? 0 : false;
  tabsBody.accordion({
    header: ".tabContent .tab",
    heightStyle: "content",
    active: active,
    icons: false,
    collapsible: true,
    create: function (event, ui) {
      //remove class that overrides site link styling
      tabsBody.find(".tabContentHolder").removeClass("ui-widget-content");
    },
    activate: function (event, ui) {
      //resize any iframe modules that are now visible
      prod.resizeModules(ui.newPanel);
    }
  });
  //check url and open accordion if tab id is present
  var hash = location.hash;
  if (hash.indexOf("tabContent_") >= 0) {
    var index = tabsBody
      .find('a[href="' + hash + '"]')
      .parents("li")
      .index();
    if (index >= 0) {
      tabsBody.accordion("option", "active", index);
      prod.scrollTo(tabsBody.closest(".sectionInner"));
    }
  }
};
prod.tabsToAccordion = function () {
  $ec(".tabsSection.tabsView").each(function () {
    var tabsBody = $ec(this).find(".sectionBody");
    //turn tabs into accordions
    if (tabsBody.data("ui-tabs")) {
      clearInterval(tabsBody.attr("data-interval"));
      tabsBody.tabs("destroy");
      prod.initAccordionInSection($ec(this));
    }
  });
};
prod.accordionToTabs = function () {
  $ec(".tabsSection.tabsView").each(function () {
    var tabsBody = $ec(this).find(".sectionBody");
    //turn accordions into tabs
    if (tabsBody.data("ui-accordion")) {
      tabsBody.accordion("destroy");
      prod.initTabsInSection($ec(this));
    }
  });
};
prod.advanceTab = function (tabsBody) {
  if (tabsBody.data("ui-tabs")) {
    var tabs = tabsBody.find(".tabArea .tab");
    var index = tabsBody.tabs("option", "active");
    var iter = 0; //keep track of iterations to prevent infinite loop
    do {
      index++;
      if (index >= tabs.length) {
        index = 0;
      }
      iter++;
    } while (tabs.eq(index).hasClass("markedDelete") && iter < tabs.length);
    //set new active tab
    tabsBody.tabs("option", "active", index);
  }
};
prod.reinitFocusPoint = function () {
  //Delay until after css changes have been made
  setTimeout(function () {
    $ec(".focusPointImage.fixedHeight").removeClass("fixedHeight");
    $ec(".focusPointImage").each(function () {
      prod.initFocusPoint($ec(this));
    });
  }, 500);
};
prod.initFocusPoint = function (selector) {
  // Fixed - Constant height / width
  // Inset - Image height / width
  // edgeToEdge - Based on monitor height / width
  var imagePositioner = selector.find(".focusPointImagePositioner");
  if (imagePositioner.length > 0) {
    var imageContainer = imagePositioner.find(".focusPointImageContainer");
    var image = imagePositioner.find(".focusPointImageHolder");
    if (image.prop("complete")) {
      image.removeClass("imageLoaded");
      var heightMultiplier = 1;
      if (selector.hasClass("sectionHeightSmall")) {
        heightMultiplier = 0.5;
      } else if (selector.hasClass("sectionHeightMedium")) {
        heightMultiplier = 0.75;
      } else if (
        selector.hasClass("fixed") &&
        imageContainer.innerHeight() > image.height()
      ) {
        selector.addClass("fixedHeight");
      }
      if (prod.isMobile() && !selector.hasClass("fixed")) {
        var imageHeight = image.height();
        if (selector.hasClass("inset")) {
          imageContainer.css("padding-top", "");
          if (selector.hasClass("imageModule")) {
            imageHeight = Math.min(imageHeight, imageContainer.innerHeight());
          }
        }
        imageHeight =
          (imageHeight / image.width()) *
          imageContainer.innerWidth() *
          heightMultiplier;
        imageContainer.css("height", imageHeight);
        if (selector.hasClass("twoThirds")) {
          var overlap = imageHeight / 3;
          var maxOverlap = selector
            .find(".headlineContentHolder")
            .innerHeight(); //do not allow overlap to exceed caption height
          selector
            .find(".focusPointImageArea")
            .css("margin-bottom", -Math.min(overlap, maxOverlap));
        }
      } else {
        imageContainer.css("height", "");
        if (selector.hasClass("twoThirds")) {
          selector.find(".focusPointImageArea").css("margin-bottom", "");
        }
        if (selector.hasClass("inset")) {
          var imagePadding =
            (imageContainer.innerHeight() / image.width()) * heightMultiplier;
          if (selector.hasClass("headlineSection")) {
            imagePadding = Math.min(
              imagePadding,
              $ec(window).height() / imageContainer.width()
            ); //do not allow height to exceed monitor height
          }
          imageContainer.css("padding-top", imagePadding * 100 + "%");
        }
      }
      image.addClass("imageLoaded");
      if (!imageContainer.data("focusPoint")) {
        imageContainer.focusPoint({
          reCalcOnWindowResize: selector.hasClass("edgeToEdge")
        });
      } else {
        imageContainer.adjustFocus();
      }
    } else {
      image.on("load", function () {
        //try again after image has loaded
        prod.initFocusPoint(selector);
      });
    }
  }
};
// absolutely, positively squash an event in the most cross-browser way imaginable, all the way back to IE8
// see http://www.quirksmode.org/js/events_order.html for a fun read
prod.killEvent = function (e) {
  e = e || window.event;
  e.cancelBubble = true;
  e.returnValue = false;
  if (e.stopPropagation) {
    e.stopPropagation();
    e.preventDefault();
  }
  return false;
};
// eases up/down to the given selector, usually an <a> with an id; mostly useful for returning to the top of a long form after submitting
// also tries to account for online form field titles when focusing fields with errors
// NOTE duration is optional, and defaults to 800ms, because that feels about right
// NOTE only scrolls if the element is not already visible
prod.scrollTo = function (selector, duration) {
  var $el = $ec(selector);
  var $fieldWrapper = $el.closest(".ofField");
  if ($fieldWrapper.length) {
    $el = $fieldWrapper;
  }
  var scrollDistance = $el.offset().top - 15;
  if ($ec("#navBackground.navSticky").length) {
    scrollDistance -= $ec("#navBackground.navSticky").outerHeight();
  }
  if ($ec("#adminToolbar").length) {
    scrollDistance -= $ec("#adminToolbar").outerHeight();
  }
  if ($fieldWrapper.length || !$el.visible()) {
    $ec("html,body").animate({ scrollTop: scrollDistance }, duration || 800);
  }
};

prod.initReplicatorCounters = function (form) {
  function init() {
    var el = $ec(this);
    var n = +el.val();
    if (el.val() !== "") {
      // allow deletion of the field
      if (n > +el.attr("max")) {
        el.val((n = +el.attr("max")));
      } else if (n < +el.attr("min")) {
        el.val((n = +el.attr("min")));
      }
    }
    el.closest("li")
      .siblings(".ofFieldGroup")
      .each(function () {
        !!n
          ? $ec(this).removeClass("ofReplicatorHidden") && n--
          : $ec(this).addClass("ofReplicatorHidden");
      });
    $ec(document).trigger("ofReplicatorInit");
  }
  var ctrs = form.find(".replicatorCounter");
  ctrs.off("input").on("input", init);
  ctrs.off("blur").on("blur", function () {
    // this field is required, but the user is allowed to clear it
    // fill a 0 if the user clears it and leaves it blank
    if ($ec(this).val() === "") {
      $ec(this).val("0");
    }
  });
  ctrs.each(init);
};
prod.clearHiddenReplicatorFields = function (form) {
  form
    .find(".ofReplicatorHidden")
    .find("input, textarea, select")
    .each(function () {
      $ec(this).val("");
      $ec(this).prop("checked", false);
      $ec(this).find("option").first().prop("selected", true);
      $ec(this).prop("disabled", true);
    });
};

prod.activateInfo = function (field) {
  field
    .find(".fieldHelpButton,.infoButton")
    .off("click")
    .click(function (e) {
      prod.killEvent(e);
      // since the help context is toggleable and we've killed the click event, nix any other visible contexts
      $ec(".fieldHelp").fadeOut(400);
      var button = $ec(this);
      var help = button.closest(".inputHolder,.infoHolder").find(".fieldHelp");
      var pos = button.position();
      if (button.is(".fieldHelpButton")) {
        help
          .css("right", "auto")
          .css("left", pos.left + button.outerWidth() + 5)
          .css("top", pos.top);
        if (help.outerWidth() < 200) {
          help
            .css("right", help.outerWidth() + 2 * (button.outerWidth() + 5))
            .css("left", "auto");
          help.addClass("rightAligned");
        }
      } else {
        // button.is('.infoButton.')
        help.css("right", 0).css("top", pos.top + button.outerHeight() + 10);
      }
      if (help.is(":hidden")) {
        help.fadeIn(400);
        $ec("body").one("click", function () {
          help.fadeOut(400);
        });
      } else {
        help.fadeOut(400);
      }
    });
};

prod.activateCount = function (field) {
  function updateCount() {
    var $el = $ec(this);
    var counter = $el.parents(".inputHolder").find(".fieldCounter");
    counter.find(".fieldCounterNumber").text($el.val().length);
  }
  field.find("textarea,input").each(updateCount);
  field.find("textarea,input").on("input", updateCount);
};

// add entries here as necessary
// TODO is it possible to select resizable elements by class, or only resize modules that need it, rather than add one function/call per resizable element?
prod.resizeModules = function (selector) {
  prod.resizeSiteName(selector.find("#siteName"));
  prod.resizeWidthAndHeight(selector.find(".video.youtube"));
  prod.resizeWidthAndHeight(selector.find(".video.vimeo"));
  prod.resizeEmbed(selector.find(".embedModule"));
  prod.resizeWidthAndHeight(
    selector.find(".mapsModule iframe, .livePlayerContainer iframe")
  );
  prod.resizeWidthAndHeight(
    selector.find(".slideshowModule.captionOverlayOn .captionPositioner")
  );

  // NOTE the code that cares about this event exists in admin_edit.js
  $ec(document).trigger("resizeOnlineForm");
};
prod.getModuleWidth = function (element) {
  var parent = element.parents(".moduleInner");
  var moduleBody = parent.find(".moduleBody");
  var modWidth =
    parent.width() -
    moduleBody.css("marginLeft").replace("px", "") -
    moduleBody.css("marginRight").replace("px", "") -
    moduleBody.css("borderLeftWidth").replace("px", "") -
    moduleBody.css("borderRightWidth").replace("px", "") -
    moduleBody.css("paddingLeft").replace("px", "") -
    moduleBody.css("paddingRight").replace("px", "");
  return modWidth;
};
prod.resizeWidthAndHeight = function (selector) {
  selector.each(function () {
    var element = $ec(this);
    var origWidth = element.attr("width");
    if (origWidth === undefined) {
      origWidth = element.width();
    }
    var origHeight = element.attr("height");
    if (origHeight === undefined) {
      origHeight = element.height();
    }
    var modWidth = prod.getModuleWidth(element);
    var modHeight = (modWidth / origWidth) * origHeight;
    element.width(modWidth);
    element.height(modHeight);
  });
};
prod.resizeWidth = function (selector) {
  selector.each(function () {
    var element = $ec(this);
    var modWidth = prod.getModuleWidth(element);
    element.width(modWidth);
  });
};
prod.resizeEmbed = function (selector) {
  selector.each(function () {
    var $this = $ec(this);
    if ($this.hasClass("RESIZE_ALL")) {
      prod.resizeWidthAndHeight($this.find("iframe"));
    } else if ($this.hasClass("RESIZE_WIDTH")) {
      prod.resizeWidth($this.find("iframe"));
    }
  });
};

prod.initializeSVG = function (selector) {
  selector.each(function () {
    var icon = $ec(this);
    var url = icon
      .css("background-image")
      .replace(/^url\(['"]?/, "")
      .replace(/['"]?\)$/, "");
    var index = url.indexOf("?");
    var ending = "";
    if (index != -1) {
      ending = "#" + url.substring(index + 1);
      url = url.substring(0, index);
    }
    if (url.split(".").pop() == "svg" && ending != "") {
      if ($ec(".svg-defs " + ending).length == 0) {
        $ec.get(url, function (data) {
          var defs = $ec(".svg-defs");
          if (defs.length == 0) {
            var div = document.createElement("div");
            div.setAttribute("class", "svg-defs");
            div.innerHTML = new XMLSerializer().serializeToString(
              data.documentElement
            );
            document.body.insertBefore(div, document.body.childNodes[0]);
          } else if ($ec(".svg-defs " + ending).length == 0) {
            defs.append(
              new XMLSerializer().serializeToString(data.documentElement)
            );
          }
        });
      }
      icon.css("background-image", "none");
      icon.prepend(
        '<svg class="icon"><use xlink:href="' + ending + '" /></svg>'
      );
    }
  });
};

$ec(function () {
  //normal page
  if ($ec("#nav").length > 0) {
    prod.setOrigSiteWidth();
    prod.sticky = $ec("#nav").hasClass("sticky");
    prod.noResize = $ec("#nav").hasClass("noResize");
    prod.checkMegaMenus();
    prod.checkMobile(true);
    $ec(window).resize(function () {
      prod.checkMobile(false);
    });
    prod.resizeNav(false);

    $ec("#navicon").click(function () {
      $ec("body").toggleClass("mobilePanelActive");
      prod.navCollapsibleOpenSelected($ec("#mobileNav"));
      //if possible, scroll to current page at vertical center of mobile panel
      var center = $ec("#mobilePanel").height() / 2;
      var top = $ec("#mobileNav .sideNavCurrent").offset().top;
      if (top > center) {
        $ec("#mobilePanel").scrollTop(top - center);
      }
      return false;
    });
    $ec(".navCollapsible.navCollapsed > ul").slideToggle(0); //Initalize the Toggle off collapsibles
    //apply to group names and not group's collapsible icon to avoid double call on one click
    $ec(".navCollapsible:not(.navPage) > .navName").click(function () {
      prod.navCollapsibleClick($ec(this).parent());
    });
    //apply to collapsible icons on pages and prevent following the link
    $ec(".navCollapsible.navPage > .navName > .collapsibleIcon").click(
      function (event) {
        event.preventDefault();
        prod.navCollapsibleClick($ec(this).closest(".navCollapsible"));
      }
    );

    prod.resizeModules($ec("body")); //this was moved to the ready event to prevent videos from changing size on the screen
    //Rerun sitename sizing after fonts have loaded
    $ec(window).on("load", function () {
      prod.resizeSiteName($ec("#siteName"));
    });
  }
  //this opens the link in data-url in a new window and prevents the original click event from going through
  $ec("#footerBrand a").click(function (event) {
    event.preventDefault();
    var url = $ec(this).data("url");
    window.open(url, "_blank");
  });
  prod.setFooterHeight();
  //Try setting up SVGs, even though the CSS may not be completely rendered yet.
  prod.initializeSVG(
    $ec(
      "#socialMediaBody a, .personSocialMedia a, #navicon, #header #searchSubmit, #header #searchPopup, .buttonModuleButton.nonCustomButton .buttonLabelContainer"
    )
  );
});
