$('#creatormenu').fadeOut(0);
var HorseActive = null;

window.addEventListener('message', function(event) {
  var Action    = event.data.Action;
  var Active    = event.data.Active;
  var DataShop  = event.data.DataShop;
  var DataHorse = event.data.DataHorse;
  var Custom    = event.data.Customize;

  if (Action == "CloseMenu") { CloseMenu(); };
  if (Action == "Hide") { $("#creatormenu").fadeOut(3000); };
  if (Action == "Show") { $("#creatormenu").fadeIn(3000); };
  if (Action == "SetActive") { HorseActive = Active; };

  if (Custom == true)  { $('#button-customization').removeClass("disabled"); };
  if (Custom == false) { $('#button-customization').addClass("disabled"); };

  if (Action == "Store") {
    $("#creatormenu").fadeIn(3000);
    for (const[I,T] of Object.entries(DataShop)) {
      var Name = T.name;
      if ($(`#page_shop .scroll-container .collapsible #${I}`).length <= 0) {
        $('#page_shop .scroll-container .collapsible').append(`
          <li id="${I}">
          <div class="collapsible-header col s12 panel "><div class="col s12 panel-title"><h6 class="grey-text">${Name}</h6></div></div>
          <div class="collapsible-body item-bg"></div>
          </li>
        `);
      };

      for (const[_, Horse] of Object.entries(T)) {
        if (_ != 'name') {
          let Modelhorse;
          var Name       = Horse.Name;
          var Stock      = 00;//minTwoDigits(horseData[1]);
          var Price      = minTwoDigits(Horse.Price);
          var BuyModel = null;

          $(`#page_shop .scroll-container .collapsible #${I} .collapsible-body`).append(`
          <div id="${_}" onhover="loadHorse(this)" class="col s12 panel item">
          <div class="col s6 panel-col item"><h6 class="grey-text title" style="color:white;">${Name}</h6></div>
            <div class="buy-buttons">
              <button class="btn-small"  onclick="buyHorse('${_}', ${Stock}, true)">
                <img src="img/stock.png"><span class="horse-price">&nbsp;&nbsp;${Stock}</span>
              </button>
              <button class="btn-small"  onclick="buyHorse('${_}', ${Price}, false)">
                <img src="img/money.png"><span class="horse-price">&nbsp;&nbsp;${Price}</span>
              </button>
            </div>
          </div>
          `);

          $(`#page_shop .scroll-container .collapsible #${I} .collapsible-body #${_}`).hover(function() {
            $( this ).click(function() {
              $(Modelhorse).addClass("selected");
              $('.selected').removeClass("selected");
              Modelhorse = $(this).attr('id');
              $(this).addClass('selected');
              $.post('http://DokusCore--Stables/loadHorse', JSON.stringify({ Model: $(this).attr('id') }));
            });
          }, function() {});
        };
      };
    };

    $('#page_myhorses .scroll-container .collapsible').html('');
    $('#page_myhorses .scroll-container .collapsible').append(`
      <li>
        <div class="collapsible-header col s12 panel ">
          <div class="col s12 panel-title">
            <h6 class="grey-text">YOU DON'T OWN HORSES</h6>
          </div>
        </div>
      </li>
    `);
    $('.collapsible').collapsible();
  };

  if (DataHorse) {
    $('#page_myhorses .scroll-container .collapsible').html('');
    for (const [I, T] of Object.entries(DataHorse)) {
      let Name  = T.Name;
      let ID    = T.ID;
      let Model = T.Model;
      let Comp  = T.Components;

      $('#page_myhorses .scroll-container .collapsible').append(`
        <li>
          <div id="heads" class="collapsible-header col s12 panel" style="background-color: transparent; border: 0;">
            <div class="col s12 panel-title"><h6 class="grey-text">${Name}</h6></div>
          </div>

          <div class="collapsible-body col s12 panel item" id="${ID}">
            <div class="col s6 panel-col item" onclick="SelectHorse(${ID}, '${Name}')"><h6 class="grey-text title">Show Your Horse</h6></div>
            <div class="col s6 panel-col item" onclick="TakeOutHorse(${ID}, '${Name}')"><h6 class="grey-text title">Take Your Horse</h6></div>
            <div class="col s6 panel-col item" onclick="RentOutHorse(${ID}, '${Name}')"><h6 class="grey-text title">Rent Out</h6></div>
            <div class="col s6 panel-col item" onclick="DoBasicNeeds(${ID}, '${Name}')"><h6 class="grey-text title">Daily Care [ 1$ ]</h6></div>
            <div class="col s6 panel-col item" onclick="TrainMyHorse(${ID}, '${Name}')"><h6 class="grey-text title">Train My Horse</h6></div>
            <div class="col s6 panel-col item" onclick="SellHorse(${ID}, '${Name}')"><h6 class="grey-text title">Sell [ 50% ]</h6></div>
            <div class="col s6 panel-col item" onclick="BreedMyHorse(${ID}, '${Name}')"><h6 class="grey-text title">Enable Breeding 10$</h6></div>
          </div>
        </li>
       `);
    };
  };
});

var currentPage = 'page_myhorses';
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
    var value = Number($(inputElement).attr('value'));
    var nValue = value + 1;
    var min = $(inputElement).attr('min');
    var max = $(inputElement).attr('max');
    if (nValue > max) { nValue = min; }
    $(inputElement).attr('value', nValue);
    var titleElement = $(this).parent().parent().find('.grey-text');
    var text = titleElement.text();
    titleElement.text(component + ' ' + nValue + '/' + max);
    $.post('http://DokusCore--Stables/'+component, JSON.stringify({ id: nValue }));
});

$(".button-left").on('click', function() {
    var inputElement = $(this).parent().find('input');
    var component = $(inputElement).attr('id');
    var value = Number($(inputElement).attr('value'));
    var nValue = value - 1;
    var min = $(inputElement).attr('min');
    var max = $(inputElement).attr('max');
    if (nValue < min) { nValue = max; }
    $(inputElement).attr('value', nValue);
    var titleElement = $(this).parent().parent().find('.grey-text');
    var text = titleElement.text();
    titleElement.text(component + ' ' + nValue + '/' + max);
    $.post('http://DokusCore--Stables/'+component, JSON.stringify({ id: nValue }));
});

$(".input-number").on("change paste keyup", function() {
    var min = Number($(this).attr('min'));
    var max = Number($(this).attr('max'));
    var value = $(this).val();
    if (value == '' || value < min) { value = min; $(this).val(value); }
    if (value > max) { value = max; $(this).val(value); }
    var titleElement = $(this).parent().parent().find('.grey-text');
    var text = titleElement.text();
    var component = text.split(' ')[0];
    titleElement.text(component + ' ' + value + '/' + max);
});
