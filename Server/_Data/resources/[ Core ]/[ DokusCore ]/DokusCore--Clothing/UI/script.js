$(document).ready(function() {
  var elements;
  var numbers;
	var translation;
  // Listen for NUI Events
  window.addEventListener('message', function(event) {

    // Set Default cam position
    if (event.data.Action == 'SetCamPos') { console.log('CAMPOS'); return $.post('http://DokusCore--Clothing/ResetCam'); };

      // Open Skin Creator
      if (event.data.openSkinCreator == true) {
          $(".skinCreator").css("display", "block");
          $(".rotation").css("display", "flex");
          elements = event.data.elements;
          numbers = event.data.numbers;
		translation = event.data.translation;
          Load();
      }
      // Close Skin Creator
      if (event.data.openSkinCreator == false) {
          $(".skinCreator").fadeOut(400);
          $(".rotation").fadeOut(400);
      }

  });

function keys(obj)
{
    var keys = [];

    for(var key in obj)
    {
        if(obj.hasOwnProperty(key))
        {
            keys.push(key);
        }
    }

    return keys;
}
    function Load() {
		const ordered = {};
		Object.keys(elements).sort().forEach(function(key) {
		  ordered[key] = elements[key];
		});
		 var element = document.getElementById("group");
		     element.innerHTML = "";
        for (x in ordered) {

            var element = document.getElementById("group");

            const box = document.createElement("div");
            box.setAttribute('class', 'input');
            element.appendChild(box);

            const box_lable = document.createElement("div");
            box_lable.setAttribute('class', 'label');
            box_lable.innerHTML = translation[x] || x;
            box.appendChild(box_lable);

            const box_lable_value = document.createElement("div");
            box_lable_value.setAttribute('class', 'label-value');
            box_lable_value.setAttribute('data-legend', '/' + ordered[x].length);
            box.appendChild(box_lable_value);

            const box_range = document.createElement("div");
            box_range.setAttribute('class', 'type-range');
            box.appendChild(box_range);

            const left_arrow = document.createElement("a");
            left_arrow.setAttribute('class', 'arrow arrow-left');
            left_arrow.setAttribute('href', '#');
            left_arrow.innerHTML = "&nbsp; ghfghfgh";
            box_range.appendChild(left_arrow);

            const input = document.createElement("input");
            input.setAttribute('type', 'range');
            input.setAttribute('class', x);
            input.setAttribute('id', x);
            input.setAttribute('min', 1);
            input.setAttribute('max', ordered[x].length);
			input.value = numbers[x];
            box_range.appendChild(input);

            const right_arrow = document.createElement("a");
            right_arrow.setAttribute('href', '#');
            right_arrow.setAttribute('class', 'arrow arrow-right');
            right_arrow.innerHTML = "&nbsp;";
            box_range.appendChild(right_arrow);

        }
        // Put value of input into label-value
        $('.input .label-value').each(function() {
            var max = $(this).attr('data-legend'),
                val = $(this).next().find('input').val();
            $(this).parent().find('.label-value').text(val + '' + max);
        });
        $('input[type=range]').change(function() {
            var value = parseFloat($(this).val()),
                max = $(this).parent().prev().attr('data-legend');
            $(this).parent().prev().text(value + '' + max);
        });
        $('.vetements .group').each(function() {
            var max = $(this).find('li:last-of-type').attr('data');
            $(this).find('.label-value').text('0/' + max);
        });
        // Put colors for input[type=radio]
        $('.color').each(function() {
            var color = $(this).attr('data-color');
            $(this).css('background-color', color);
        });



        // Arrows for input[type=range]
        $('.arrow-right').on('click', function(e) {
            e.preventDefault();
            var value = parseFloat($(this).prev().val()),
                newValue = parseFloat(value + 1),
                max = $(this).parent().prev().attr('data-legend');
            $(this).prev().val(newValue);
            $(this).parent().prev().text(newValue + '' + max);
        });

        $('.arrow-left').on('click', function(e) {
            e.preventDefault();
            var value = parseFloat($(this).next().val()),
                newValue = parseFloat(value - 1),
                max = $(this).parent().prev().attr('data-legend');
            $(this).next().val(newValue);
            $(this).parent().prev().text(newValue + '' + max);
        });

        // Arrows for clothes module
        $('.arrowvetement-right').on('click', function(e) {
            var li = $(this).parent().find('li.active'),
                active = li.next(),
                id = active.attr('data'),
                max = $(this).parent().find('li:last-of-type').attr('data');
            if ($(this).prev().hasClass('active')) {
                li.removeClass('active');
                $(this).parent().find('li:first-of-type').addClass('active');
                $(this).parent().parent().find('.label-value').text('0/' + max)
            } else {
                li.removeClass('active');
                active.addClass('active');
                $(this).parent().parent().find('.label-value').text(id + '/' + max)
            }
        });
        $('.arrowvetement-left').on('click', function(e) {
            var li = $(this).parent().find('li.active'),
                active = li.prev(),
                id = active.attr('data'),
                max = $(this).parent().find('li:last-of-type').attr('data');
            if ($(this).next().hasClass('active')) {
                li.removeClass('active');
                $(this).parent().find('li:last-of-type').addClass('active');
                $(this).parent().parent().find('.label-value').text(max + '/' + max)
            } else {
                li.removeClass('active');
                active.addClass('active');
                $(this).parent().parent().find('.label-value').text(id + '/' + max)
            }
        });



        // Click on tab nav
        $('.tab a').on('click', function(e) {
            e.preventDefault();
            var link = $(this).attr('data-link');
            $('.tab a').removeClass('active');
            $('.tab a.' + link).addClass('active').removeClass('disabled');

            $(this).addClass('disabled');
            $('.block.active').fadeOut(200, function() {
                $('.block').removeClass('active');
                $('.block.' + link).fadeIn(200, function() {
                    $(this).addClass('active');
                });
            });
        });

        // Popup click on submit
        $('.submit').on('click', function(e) {
            e.preventDefault();
            $('.popup').fadeIn(200);
        });
        $('.popup .button').on('click', function(e) {
            e.preventDefault();
            $('.popup').fadeOut(200);
        });

        // Scroll with arrows keys
        var x = 0;
        var n = 100;
        $(document).keydown(function(e) {
            if (e.which == 40) {
                x += n;
                $('#formSkinCreator').animate({
                    scrollTop: x
                }, 400);
            }
            if (e.which == 38) {
                x -= n;
                $('#formSkinCreator').animate({
                    scrollTop: x
                }, 400);
            }
        });

        // Form update
        $('input').change(function() {
            $.post('http://DokusCore--Clothing/updateClothes', GetOutput());
        });


        $('.arrow').on('click', function(e) {
            e.preventDefault();
            $.post('http://DokusCore--Clothing/updateClothes', GetOutput());
        });

    }

    function GetOutput() {
        const data = {};
        for (x in elements) {
                var val = document.getElementById(x).value;
                data[x] = val;
        }
		 var val = document.getElementById("name").value;
         data["name"] = val;
        return JSON.stringify(data);
    }

    // Form submited
    $('.yes').on('click', function(e) {
        e.preventDefault();
        $.post('http://DokusCore--Clothing/saveClothes', GetOutput());
    });

    $('.exit').on('click', function(e) {
        e.preventDefault();
        $.post('http://DokusCore--Clothing/exit');
    });

    // Camera Contols
    $(document).keypress(function(e) {
      if (e.which == 113) { $.post('http://DokusCore--Clothing/Heading', JSON.stringify({ Heading: -2.5 })); }; // Q
      if (e.which == 120) { $.post('http://DokusCore--Clothing/ResetCam'); };                                   // X
      if (e.which == 101) { $.post('http://DokusCore--Clothing/Heading', JSON.stringify({ Heading: 2.5 })); };  // E
		  if (e.which == 119) { $.post('http://DokusCore--Clothing/Camera', JSON.stringify({ offset: 0.008 })); };  // W
		  if (e.which == 115) { $.post('http://DokusCore--Clothing/Camera', JSON.stringify({ offset: -0.008})); };  // S
		  if (e.which == 97)  { $.post('http://DokusCore--Clothing/Camera', JSON.stringify({ zoom: 0.008 })); };    // A
		  if (e.which == 100) { $.post('http://DokusCore--Clothing/Camera', JSON.stringify({ zoom: -0.008 })); };   // D
    });



});
