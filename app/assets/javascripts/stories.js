$(function() {
	var $bookBlock = $('#bb-bookblock');
	var $slides = $bookBlock.children();
	var $navFirst=$('#bb-nav-first');
	var $navPrev=$('#bb-nav-prev');
	var $navNext=$('#bb-nav-next');
	var $navLast=$('#bb-nav-last');

	$bookBlock.bookblock();

	// add navigation events
	$navNext.on('click touchstart', function() {
		$bookBlock.bookblock('next');
		return false;
	});

	$navPrev.on('click touchstart', function() {
		$bookBlock.bookblock('prev');
		return false;
	});

	$navFirst.on('click touchstart', function() {
		$bookBlock.bookblock('first');
		return false;
	});

	$navLast.on('click touchstart', function() {
		$bookBlock.bookblock('last');
		return false;
	});

	// add swipe events
	$slides.on({
		'swipeleft': function(event) {
			$bookBlock.bookblock('next');
			return false;
		},
		'swiperight': function(event) {
			$bookBlock.bookblock('prev');
			return false;
		}
	});

	// add keyboard events
	$(document).keydown(function(event) {
		var keyCode = event.keyCode || event.which,
			arrow = {
				left: 37,
				up: 38,
				right: 39,
				down: 40
			};

		switch (keyCode) {
			case arrow.left:
				$bookBlock.bookblock('prev');
				break;
			case arrow.right:
				$bookBlock.bookblock('next');
				break;
		}
	});
});
