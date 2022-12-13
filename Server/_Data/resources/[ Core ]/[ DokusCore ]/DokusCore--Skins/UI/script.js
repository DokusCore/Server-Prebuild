$('#creatormenu').fadeOut(0);
window.addEventListener('message', function(event) {

  if (event.data.Action == "HideUI") { $("#creatormenu").fadeOut(500); };
  if (event.data.Action == "ShowUI") { $("#creatormenu").fadeIn(500);  };

    if (event.data.Action == "Show") {
        $("#creatormenu").fadeIn(500);
        Gender = event.data.Gender;

        if (Gender == "MP_FEMALE") {
          $("#Beard").hide();
        };

        if (Gender == 'MP_MALE') {
          document.getElementById("Beard").classList.remove("disabled");
        };

        // Set Gender for the NUI calls
        $.post('http://DokusCore--Skins/SetGender', JSON.stringify({ Gender: Gender }));

        if (event.data.Action == "Hide") {
            $("#creatormenu").fadeOut(500);
        };


    };
});

function required()     {
    var empt = document.getElementById("NomePlayer").value;
    var empt2 = document.getElementById("Idade").value;

    if (empt == "")
        {
            $.post('http://DokusCore--Skins/CheckButtons');
            return false;
        }
    else if(empt2 == "")
        {
            $.post('http://DokusCore--Skins/CheckButtons');
            return false;
        }
    else {
        {
            return true;
        }
    }
}

var currentPage = 'char-info';

$('.menu-selectb').on('click', function() {
    $(`#${currentPage}`).hide();

    currentPage = $(this).data('target');
    $(`#${currentPage}`).show();

    $('.menu-selectb.active').removeClass('active');
    $(this).addClass('active');
});

$(".button-right").on('click', function() {
    var inputElement = $(this).parent().find('input');
    var component = $(inputElement).attr('id');
    var facefeature = $(inputElement).attr('data-value');
    var step = $(inputElement).attr('step');
    var value = Number($(inputElement).attr('value'));
    // value = Number(String.split(value, '/')[0]);
    var nValue = value + 1;

    if (step != undefined) {
        nValue = value + 0.1;
    }

    var min = $(inputElement).attr('min');
    var max = $(inputElement).attr('max');

    if (nValue > max) {
        nValue = min;
    }

    if (step == undefined) {
        var titleElement = $(this).parent().parent().find('.qtd');
        var text = titleElement.text();
        var namecomp = text.split(' ')[0];
        // titleElement.text(nValue + '/' + max);
    }

    nValue = parseFloat(parseFloat(nValue).toFixed(1));

    $(inputElement).attr('value', nValue);

    var id = nValue;

    if (facefeature == undefined) {
        $.post('http://DokusCore--Skins/' + component, JSON.stringify({ id }));
    } else {
        $.post('http://DokusCore--Skins/' + component, JSON.stringify({ facefeature: facefeature, id: id }));
    }

});

$(".button-left").on('click', function() {
    var inputElement = $(this).parent().find('input');
    var component = $(inputElement).attr('id');
    var facefeature = $(inputElement).attr('data-value');
    var step = $(inputElement).attr('step');
    var value = Number($(inputElement).attr('value'));
    // value = Number(String.split(value, '/')[0]);
    var nValue = value - 1;

    if (step != undefined) {
        nValue = value - 0.1;
    }

    var min = $(inputElement).attr('min');
    var max = $(inputElement).attr('max');

    if (nValue < min) {
        nValue = max;
    }

    if (step == undefined) {
        var titleElement = $(this).parent().parent().find('.qtd');
        var text = titleElement.text();
        var namecomp = text.split(' ')[0];
        // titleElement.text(nValue + '/' + max);
    }

    nValue = parseFloat(parseFloat(nValue).toFixed(1));

    $(inputElement).attr('value', nValue);

    var id = nValue;

    if (facefeature == undefined) {
        $.post('http://DokusCore--Skins/' + component, JSON.stringify({ id }));
    } else {
        $.post('http://DokusCore--Skins/' + component, JSON.stringify({ facefeature: facefeature, id }));
    }

});
function confirm(){
    $("#creatormenu").fadeOut(500);
    $("#creatormenu").css("display","none");

    $.post('http://DokusCore--Skins/CloseCreator');
}

function changeoptions(name) {
    var change = document.getElementById(name).value;
    $.post('http://DokusCore--Skins/' + name,  JSON.stringify({ change }));
}


$(".input-number").on("change paste keyup", function() {

    var min = Number($(this).attr('min'));
    var max = Number($(this).attr('max'));

    var value = $(this).val();

    if (value == '' || value < min) {
        value = min;
        $(this).val(value);
    }

    if (value > max) {
        value = max;
        $(this).val(value);
    }

    var titleElement = $(this).parent().parent().find('.grey-text');
    var text = titleElement.text();
    var component = text.split(' ')[0];
    titleElement.text(component + ' ' + value + '/' + max);
});


window.addEventListener("keydown", function (ev) {
    var input = $(ev.target);
    var num = input.hasClass('input-number');
    var _key = false;
    if (ev.which == 37) { _key = "left"  };
    if (ev.which == 39) { _key = "right" };
    $.post('http://DokusCore--Skins/Rotation', JSON.stringify({ Key: _key }));
});
