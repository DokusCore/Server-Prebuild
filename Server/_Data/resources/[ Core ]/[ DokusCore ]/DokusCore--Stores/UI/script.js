var aType = null
var aPrice = 0
var aAmount = 1

document.addEventListener('DOMContentLoaded', function() {
  $(".container").hide();
  $("#confirmation-container").hide();
});

window.addEventListener("message", function(event) {
  var Data = event.data
  var Custom = event.data.IsCustom

  if (Custom) {
    $(".Switch1").hide();
    $(".Switch2").hide();
  };

  if (Data.Display == true) {
    if (Data.Type == 'Buy') {
      aType = false
      $(".container").show();
      ShowShop(Data.ShopName, Data.StoreData)
    } else if (Data.Type == 'Sell') {
      aType = true
      $(".container").show();
      ShowShop(Data.ShopName, Data.StoreData)
    }
  }
});

function ShowShop(ShopName, Items) {
  $('.slot-container').html('');
  $('.title').text(ShopName);

  if (aType) {
    Items.forEach((Item, i) => {
      $('.slot-container').append(`
       <div class="slot" id="${Item.Item}" onclick="select(this)">
        <img src="nui://DokusCore--Inventory/UI/img/Items/${Item.Item}.png">
       </div>
      `);

      var element = $(`.slot-container #${Item.Item}`);
      $(element).attr('shopId', Item.Item);
      $(element).attr('name', Item.Name);
      $(element).attr('description', Item.Desc);
      $(element).attr('p_dollar', Item.Sell);
    });
  } else {
    Items.forEach((Item, i) => {
      $('.slot-container').append(`
       <div class="slot" id="${Item.Item}" onclick="select(this)">
        <img src="nui://DokusCore--Inventory/UI/img/Items/${Item.Item}.png">
       </div>
      `);

      var element = $(`.slot-container #${Item.Item}`);
      $(element).attr('shopId', Item.Item);
      $(element).attr('name', Item.Name);
      $(element).attr('description', Item.Desc);
      $(element).attr('p_dollar', Item.Buy);
    });
  }


};

function select(element) {
  if ($(element).attr('id') != undefined) {
    $('.selected').removeClass('selected');
    $('#name').text('');
    $('#description').text('');
    $(element).addClass('selected');

    var item_name = $(element).attr('name');
    var item_description = $(element).attr('description');
    var item_p_dollar = $(element).attr('p_dollar');
    aPrice = item_p_dollar
    cPrice = (aPrice * aAmount).toFixed(2);
    $('#p_dollar').text(cPrice);
    $('.description-title').text(item_name);
    $('.description-description').text(item_description);
    $('#confirmation-container #confirm_title').text(item_name);
  };
};

function Action() {
  if (aType) {
    if ($('.selected').length == 1) {
      var itemName = $('.selected').attr('name');
      $('#confirmation-container').fadeIn(250);
      $('#confirmation-container #confirm_title').text('Sell ' + itemName);
      $('#p_dollar_img').removeClass('fhover_dollar');
    } else {
      $.post('http://DokusCore--Stores/NoSelectItemError', JSON.stringify({}));
      return;
    };
  } else {
    if ($('.selected').length == 1) {
      var itemName = $('.selected').attr('name');
      $('#confirmation-container').fadeIn(250);
      $('#confirmation-container #confirm_title').text('Buy ' + itemName);
      $('#p_dollar_img').removeClass('fhover_dollar');
    } else {
      $.post('http://DokusCore--Stores/NoSelectItemError', JSON.stringify({}));
      return;
    };
  }
};

function Confirm() {
  if (aType) {
    if ($('.selected').length > 0) {
      var sItem = $('.selected').attr('id');
      $('#confirmation-container').hide();
      $('#p_dollar_img').removeClass('fhover_dollar');
      $(".container").hide();
      $.post('http://DokusCore--Stores/SellItem', JSON.stringify({
        Item: sItem,
        Price: (aPrice * aAmount).toFixed(2),
        Amount: aAmount
      }));

      aPrice = 0;
      aAmount = 1;
      document.getElementById('MenuNumber').innerHTML = aAmount;
      document.getElementById('p_dollar').innerHTML = 0;
    };
  } else {
    if ($('.selected').length > 0) {
      var sItem = $('.selected').attr('id');
      $('#confirmation-container').hide();
      $('#p_dollar_img').removeClass('fhover_dollar');
      $(".container").hide();
      $.post('http://DokusCore--Stores/BuyItem', JSON.stringify({
        Item: sItem,
        Price: (aPrice * aAmount).toFixed(2),
        Amount: aAmount
      }));

      aPrice = 0;
      aAmount = 1;
      document.getElementById('MenuNumber').innerHTML = aAmount;
      document.getElementById('p_dollar').innerHTML = 0;
    };
  };
};

function cancelPurchase() {
  $('#confirmation-container').hide();
  $('#p_dollar_img').removeClass('fhover_dollar');
};

function Exit() {
  aPrice = 0;
  aAmount = 1;
  $(".container").fadeOut(100);
  $("#ui").css('display', 'none');
  document.getElementById('MenuNumber').innerHTML = aAmount;
  document.getElementById('p_dollar').innerHTML = 0;
  $.post('http://DokusCore--Stores/CloseNUI', JSON.stringify({}));
};

function SwitchScreen() {
  $(".container").fadeOut(100);
  $("#ui").css('display', 'none');
  if (aType == true) {
    aType = null
    $.post('http://DokusCore--Stores/OpenSellScreen', JSON.stringify({}));
  } else if (aType == false) {
    aType = null
    $.post('http://DokusCore--Stores/OpenBuyScreen', JSON.stringify({}));
  };
};

function ClickPlus() {
  aAmount = ( aAmount + 1 )
  document.getElementById('MenuNumber').innerHTML = aAmount;
  document.getElementById('p_dollar').innerHTML = (aPrice * aAmount).toFixed(2);
};

function ClickMinus() {
  aAmount = ( aAmount - 1 )
  if (aAmount <= 1) { aAmount = 1; };
  document.getElementById('MenuNumber').innerHTML = aAmount;
  document.getElementById('p_dollar').innerHTML = (aPrice * aAmount).toFixed(2);
};


// Close the store on ESC and BACKSPACE
$(document).keyup(function(Data) {
  var Code = Data.keyCode
  if (Code == 8 || Code == 27) {
    aType = null
    aPrice = 0;
    aAmount = 1;
    $(".container").fadeOut(100);
    $("#ui").css('display', 'none');
    document.getElementById('MenuNumber').innerHTML = aAmount;
    document.getElementById('p_dollar').innerHTML = 0;
    $.post('http://DokusCore--Stores/CloseNUI', JSON.stringify({}));
  } else if (Code == 13) { Confirm() };
});
