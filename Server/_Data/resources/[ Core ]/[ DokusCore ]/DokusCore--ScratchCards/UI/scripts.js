var isscratch = false;
var MyReward = 0;

$(function () {
	window.addEventListener('message', function (event) {

		if (event.data.type == 'shownui') {
			$('html').css('display', 'block');
			document.getElementById('arkaplan').src = 'img/background.png';
			$('.layout').css('display', 'block');
		}
		MyReward = event.data.value
		let reward = event.data.value
		let threshold = event.data.threshold
		var doc = document
		var cvs = doc.getElementById('scrCanvas')
		var ctx = null
		var rewardcanvas = doc.getElementById('rewardCanvas')
		var config = { w: 500, h: 100 }
		var mouseDown = false
		cvs.style.position = "absolute";
		function getCoords(elem, ev) {
			var ox = 0, oy = 0;
			var first;
			var pageX, pageY;
			while (elem != null) {
				ox += elem.offsetLeft;
				oy += elem.offsetTop;
				elem = elem.offsetParent;
			}
			if ("changedTouches" in ev) {
				first = ev.changedTouches[0];
				pageX = first.pageX;
				pageY = first.pageY;
			} else {
				pageX = ev.pageX;
				pageY = ev.pageY;
			}
			return { 'x': pageX - ox, 'y': pageY - oy };
		}

		function diffTransSize(cxt, threshold, callback) {
			if (!'getImageData' in ctx) return;
			threshold = threshold || 0.5;
			if (threshold > 1 || threshold < 0) threshold = 1;
			var imageData = ctx.getImageData(0, 0, cvs.width, cvs.height),
				pix = imageData.data,
				pixLength = pix.length,
				pixelSize = pixLength * 0.25;
			var i = 1, k, l = 0;
			for (; i <= pixelSize; i++) {
				if (0 === pix[4 * i - 1]) l++;
			};
			if (l > pixelSize * threshold) {
				callback.apply(ctx, [l]);
			};
			return;
		}

		function scratchLine(cvs, x, y, fresh) {
			ctx = cvs.getContext('2d');
			ctx.globalCompositeOperation = 'destination-out';

			ctx.lineWidth = 20;
			ctx.lineCap = ctx.lineJoin = 'round';
			ctx.strokeStyle = 'rgba(0,0,0,1)';
			if (fresh) {
				ctx.beginPath();
				ctx.moveTo(x + 0.1, y);
			}
			ctx.lineTo(x, y);
			ctx.stroke();
			var style = cvs.style;
			style.lineHeight = style.lineHeight == '1' ? '1.1' : '1';

			diffTransSize(ctx, threshold, function () {
				if (isscratch == true)
					return;

				isscratch = true;
				return;
			});
		}

		function createCanvas() {
			cvs.width = config.w;
			cvs.height = config.h;
			var ctx = cvs.getContext("2d");
			var bg = new Image();
			bg.src = 'img/scratch.png';
			bg.onload = function () {
				ctx.drawImage(bg, 0, -10);
			}
			rewardcanvas.width = config.w;
			rewardcanvas.height = config.h;
			var ctx2 = rewardcanvas.getContext("2d");
			ctx2.font = "80px Redemption";
			ctx2.textAlign = "center";
			ctx2.globalAlpha = 0.5;
			ctx2.fillText("$" + reward, rewardcanvas.width / 2, (rewardcanvas.height / 1.5) + 5);

			var mousedown_handler = function (e) {
				var local = getCoords(cvs, e);
				mouseDown = true;
				scratchLine(cvs, local.x, local.y, true);
				if (e.cancelable) { e.preventDefault(); }
				return false;
			};
			var mousemove_handler = function (e) {
				if (!mouseDown) { return true; }
				var local = getCoords(cvs, e);
				scratchLine(cvs, local.x, local.y, false);

				if (e.cancelable) { e.preventDefault(); }
				return false;
			};
			var mouseup_handler = function (e) {
				if (mouseDown) {
					mouseDown = false;
					if (e.cancelable) { e.preventDefault(); }
					return false;
				}
				return true;
			};
			on(cvs, 'mousedown', mousedown_handler);
			on(cvs, 'touchstart', mousedown_handler);
			on(window, 'mousemove', mousemove_handler);
			on(window, 'touchmove', mousemove_handler);
			on(window, 'mouseup', mouseup_handler);
			on(window, 'touchend', mouseup_handler);
		}
		function on(E, N, FN) {
			E.addEventListener ? E.addEventListener(N, FN, !1) : E.attachEvent('on' + N, FN);
		}
		createCanvas();
	});
});

document.onkeyup = function (data) {
	if (((data.which == 27) || (data.which == 8)) && (isscratch == true)) {
		isscratch = false;
		$('.layout', 'html').hide();
		$('body').removeClass("active");
		$.post('http://DokusCore--ScratchCards/closenui', JSON.stringify({ Prize: MyReward }));
		MyReward = 0;
		return;
	}
}
