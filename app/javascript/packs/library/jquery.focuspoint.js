/**
 * jQuery FocusPoint; version: 1.1.3
 * Author: http://jonathonmenz.com
 * Source: https://github.com/jonom/jquery-focuspoint
 * Copyright (c) 2014 J. Menz; MIT License
 * @preserve
 */
;
(function($) {

	var defaults = {
		reCalcOnWindowResize: true,
		throttleDuration: 17 //ms - set to 0 to disable throttling
	};

	//Setup a container instance
	var setupContainer = function($el) {
		var imageSrc = $el.find('img').attr('src');
		$el.data('imageSrc', imageSrc);
		if ($el.find('img').prop('complete')) {
			adjustFocus($el);
		} else {
			$el.find('img').on('load', function() {
				adjustFocus($el);
			});
		}
	};

	//Create a throttled version of a function
	var throttle = function(fn, ms) {
		var isRunning = false;
		return function() {
			var args = Array.prototype.slice.call(arguments, 0);
			if (isRunning) return false;
			isRunning = true;
			setTimeout(function() {
				isRunning = false;
				fn.apply(null, args);
			}, ms);
		};
	};

    //Calculate the new left/top values of an image
    /*
        changes to this function 
            - modify focus factor to be a percentage from the top left instead of a coordinate plane
            - allow for scaled image to be larger than container
            - return a pixel value instead of a percentage
    */
	var calcShift = function(conToImageRatio, containerSize, imageSize, focusFactor) {
		var containerCenter = Math.floor(containerSize / 2); //Container center in px
		var scaledImage = Math.floor(imageSize / conToImageRatio); //Can't use width() as images may be display:none
        if(scaledImage < imageSize) scaledImage = imageSize;
        var focus = Math.floor(focusFactor * scaledImage);
		var focusOffset = focus - containerCenter; //Calculate difference between focus point and center
		var remainder = scaledImage - focus; //Reduce offset if necessary so image remains filled
		var containerRemainder = containerSize - containerCenter;
		if (remainder < containerRemainder) focusOffset -= containerRemainder - remainder;
        if (focusOffset < 0) focusOffset = 0;

		return (focusOffset * -1);
	};

	//Re-adjust the focus
	var adjustFocus = function($el) {
		var imageSrc = $el.data('imageSrc');

        if (!imageSrc) {
			return setupContainer($el); //Setup the container first
		}

        var containerW = $el.innerWidth();
		var containerH = $el.innerHeight();
		var focusX = parseFloat($el.data('focusX'));
		var focusY = parseFloat($el.data('focusY'));
        var $image = $el.find('img').first();
		
		//this will take into account any scaling done by the transform css
		var imageW = $image[0].getBoundingClientRect().width;
        var imageH = $image[0].getBoundingClientRect().height;

		//Amount position will be shifted
		var hShift = 0;
		var vShift = 0;

		if (!(containerW > 0 && containerH > 0 && imageW > 0 && imageH > 0)) {
			return false; //Need dimensions to proceed
		}

		//Which is over by more?
		var wR = imageW / containerW;
		var hR = imageH / containerH;

		//Fill space
		$image.css((wR > hR) ? 'height' : 'width', '100%');
		$image.css((wR < hR) ? 'height' : 'width', 'auto');
		imageW = $image[0].getBoundingClientRect().width;
        imageH = $image[0].getBoundingClientRect().height;
		wR = imageW / containerW;
		hR = imageH / containerH;

		//image may need to shift in one or both directions
		if(containerW < imageW) {
			hShift = calcShift(hR, containerW, imageW, focusX);
		}
		if(containerH < imageH) {
			vShift = calcShift(wR, containerH, imageH, focusY);
		}

		$image.css({
			top: vShift,
			left: hShift
		});
	};

	var $window = $(window);

	var focusPoint = function($el, settings) {
		var thrAdjustFocus = settings.throttleDuration ?
			throttle(function(){adjustFocus($el);}, settings.throttleDuration)
			: function(){adjustFocus($el);};//Only throttle when desired
		var isListening = false;

		adjustFocus($el); //Focus image in container

		//Expose a public API
		return {

			adjustFocus: function() {
				return adjustFocus($el);
			},

			windowOn: function() {
				if (isListening) return;
				//Recalculate each time the window is resized
				$window.on('resize', thrAdjustFocus);
				return isListening = true;
			},

			windowOff: function() {
				if (!isListening) return;
				//Stop listening to the resize event
				$window.off('resize', thrAdjustFocus);
				isListening = false;
				return true;
			}

		};
	};

	$.fn.focusPoint = function(optionsOrMethod) {
		//Shortcut to functions - if string passed assume method name and execute
		if (typeof optionsOrMethod === 'string') {
			return this.each(function() {
				var $el = $(this);
				$el.data('focusPoint')[optionsOrMethod]();
			});
		}
		//Otherwise assume options being passed and setup
		var settings = $.extend({}, defaults, optionsOrMethod);
		return this.each(function() {
			var $el = $(this);
			var fp = focusPoint($el, settings);
			//Stop the resize event of any previous attached
			//focusPoint instances
			if ($el.data('focusPoint')) $el.data('focusPoint').windowOff();
			$el.data('focusPoint', fp);
			if (settings.reCalcOnWindowResize) fp.windowOn();
		});

	};

	$.fn.adjustFocus = function() {
		//Deprecated v1.2
		return this.each(function() {
			adjustFocus($(this));
		});
	};

})($ec);