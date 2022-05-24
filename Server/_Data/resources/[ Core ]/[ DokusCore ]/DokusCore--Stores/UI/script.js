var aType = null
var aPrice = 0
var aAmount = 0

document.addEventListener('DOMContentLoaded', function() {
  $(".container").hide();
  $("#confirmation-container").hide();
});

window.addEventListener("message", function(event) {
  var Data = event.data
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
  // /* Plus and minus signs calculation */
  // if (Data.message == "add"){
	// 	$( ".container" ).append(/*'<div class="card">' +
	// 				'<div class="image-holder">' +
	// 					'<img src="img/' + Data.item + '.png" onerror="this.src = \'img/default.png\'" alt="' + Data.label + '" style="width:100%;">' +
	// 				'</div>' +
	// 				'<div class="container" style=" max-width: 100%;overflow: hidden;text-overflow: ellipsis;">' +
	// 					'<h4 style="white-space: nowrap; font-size: 0.8vw;"><b>' + Data.label + '<div class="price">' + Data.price + '$' + '</div>' + '</b></h4> ' +
	// 					*/'<div class="quantity">' +
	// 						'<div class="minus-btn btnquantity" name="' + Data.item + '" id="minus">' +
	// 							'<img src="img/minus.png" alt="" />' +
	// 						'</div>' +
	// 						'<div class="number" name="name">1</div>' +
	// 						'<div class="plus-btn btnquantity" name="' + Data.item + '" id="plus">' +
	// 							'<img src="img/plus.png" alt="" />' +
	// 						'</div>' +
	// 					'</div>'/* +
	// 					'<div class="purchase">' +
  //
	// 						'<div class="buy" name="' + Data.item + '">Kup</div>' +
	// 					'</div>' +
	// 				'</div>' +
	// 			'</div>'*/);
	// 	//prices[Data.item] = Data.price;
	// 	maxes[Data.item] = 99;
	// 	//zone = Data.loc;
	// }
  // //ends here//
  ;
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

    $('#p_dollar').text(item_p_dollar);
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
        Price: aPrice
      }));
    };
  } else {
    if ($('.selected').length > 0) {
      var sItem = $('.selected').attr('id');
      $('#confirmation-container').hide();
      $('#p_dollar_img').removeClass('fhover_dollar');
      $(".container").hide();
      $.post('http://DokusCore--Stores/BuyItem', JSON.stringify({
        Item: sItem,
        Price: aPrice
      }));
    };
  };
};

function cancelPurchase() {
  $('#confirmation-container').hide();
  $('#p_dollar_img').removeClass('fhover_dollar');
};

function Exit() {
  $(".container").fadeOut(100);
  $("#ui").css('display', 'none');
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
  console.log('New Amount', aAmount);
};

function ClickMinus() {
  aAmount = ( aAmount - 1 )
  console.log('New Amount', aAmount);
};


// Close the store on ESC and BACKSPACE
$(document).keyup(function(Data) {
  var Code = Data.keyCode
  if (Code == 8 || Code == 27) {
    aType = null
    $(".container").fadeOut(100);
    $("#ui").css('display', 'none');
    $.post('http://DokusCore--Stores/CloseNUI', JSON.stringify({}));
  } else if (Code == 13) { Confirm() };
});

// /* Plus and minus signs calculation*/
// $(".container").on("click", ".btnquantity", function() {
//
// 	var $button = $(this);
// 	var $name = $button.attr('name')
// 	var oldValue = $button.parent().find(".number").text();
// 	if ($button.get(0).id == "plus") {
// 		if (oldValue <  maxes[$name]){
// 			var newVal = parseFloat(oldValue) + 1;
// 		}else{
// 			var newVal = parseFloat(oldValue);
// 		}
// 	} else {
// 	// Don't allow decrementing below zero
// 		if (oldValue > 1) {
// 			var newVal = parseFloat(oldValue) - 1;
// 		} else {
// 			newVal = 1;
// 		}
// 	}
// 	//$button.parent().parent().find(".price").text((prices[$name] * newVal) + "$");
// 	$button.parent().find(".number").text(newVal);
//
// });
//
// // ends here //
