$('document').ready(function() {
  $('.overlay').hide();

  window.addEventListener('message', function(event) {
    const Action = event.data.action
    if (Action == 'open') { $('.overlay').show(); }
    if (Action == 'close') {
      $('.overlay').hide();
      clearDocument()
      $.post('http://DokusCore--Inventory/NUIFocusOff', JSON.stringify({}));
    }

    function SortItems() {
      let Array = []
      let Data = event.data.items
      if (Data != undefined) { for (let i = 0; i < 50; i++) { Array.push(Data[i]) } }
      Array.forEach(function(item) {
        if (item != undefined) {
          $('.item-inner').append(`<div class="${item[0]} default" id="${item[0]}"><div>`);
          $(`#${item[0]}`).html(item[1])
          $(`#${item[0]}`).css({
            'padding': '1px',
            'color': 'white',
            'height': '15%',
            'width': '15%',
            'float': 'left',
            'background-position': 'center',
            'background-color': '#161616',
            'box-shadow:': '11px 15px 13px 0px rgba(0,0,0,0.75)',
            'border-radius': '5px',
            'border': 'rgb(69, 69, 69) solid 1px',
            'margin': '1%'
          })
        };
      })
      Array = []
    }
    SortItems()
    document.getElementById('cash').innerHTML = event.data.wallet
    document.getElementById('gold').innerHTML = event.data.gold
    document.getElementById('bank').innerHTML = event.data.bank
    document.getElementById('job').innerHTML = event.data.label
  });

  var containers = dragula([
    document.getElementById('drag1'),
    document.getElementById('drag2'),
  ])

  containers.on('drop', function(el, target, source, sibling) {
    if (source.id == 'drag1' && source.id != target.id) {
      $('#drag2').each(function() {
        let count = $(this).children(`.${el.id}`).length;
        if (count > 1) {
          $(`.${el.id}`)[0].innerHTML = Number($(`.${el.id}`)[0].innerHTML) + Number($(`.${el.id}`)[1].innerHTML)
          $(`.${el.id}`)[1].remove()
        }
      })
    } else if (source.id == 'drag2' && source.id != target.id) {
      $.post('http://DokusCore--Inventory/drop', JSON.stringify({
        count: Number(el.innerHTML),
        item: el.id
      }));
      $(`#${el.id}`).css('background-color', '#161616');
      $(`#${el.id}`).removeClass('selected')
      $(`#${el.id}`).hide()
    }
  });

  $('body').on('click', '.default', (event) => {
    var selectedItem = event.target.id
    $('#drag2').children().css('background-color', '#161616');
    $('#drag2').children().removeClass('selected');
    $('#money').removeClass('selected');
    $('#money').css('background-color', '#161616');
    $('#blackcash').removeClass('selected');
    $('#blackcash').css('background-color', '#161616');
    $(`#${selectedItem}`).addClass('selected');
    $(`#${selectedItem}`).css('background-color', '#242424');
  })

  document.getElementById('money').addEventListener('click', function(event) {
    $('#drag2').children().css('background-color', '#161616');
    $('#drag2').children().removeClass('selected')
    $(`#blackcash`).removeClass('selected');
    $(`#blackcash`).css('background-color', '#161616');
    $(`#money`).addClass('selected');
    $(`#money`).css('background-color', '#242424');
  })

  document.getElementById('blackcash').addEventListener('click', function(event) {
    $('#drag2').children().css('background-color', '#161616');
    $('#drag2').children().removeClass('selected')
    $(`#money`).removeClass('selected');
    $(`#money`).css('background-color', '#161616');
    $(`#blackcash`).addClass('selected');
    $(`#blackcash`).css('background-color', '#242424');
  })

  document.getElementById('button-use').addEventListener('click', function(event) {
    var itemSelected = document.getElementsByClassName('selected')[0].id;
    let amount = Number(document.getElementById('drop-count').value)
    $.post('http://DokusCore--Inventory/UseItem', JSON.stringify({
      Item: itemSelected,
      Count: amount
    }));
  })

  document.getElementById("button-drop").addEventListener("click", function(event) {
    DropItem()
  });

  function DropItem() {
    var itemSelected = document.getElementsByClassName('selected')[0];
    if (itemSelected == undefined) {
      $.post('http://DokusCore--Inventory/NoAmountSet', JSON.stringify({}));
      return
    }

    if (itemSelected.id == 'money') {
      let amount = Number(document.getElementById('drop-count').value)
      $.post('http://DokusCore--Inventory/dropcash', JSON.stringify({
        count: amount
      }));
    }

    if (document.getElementsByClassName('selected')[0].id == 'blackcash') {
      let amount2 = Number(document.getElementById('drop-count').value)
      $.post('http://DokusCore--Inventory/dropblackcash', JSON.stringify({
        count: amount2
      }));
    }

    if (Number(document.getElementById('drop-count').value) > document.getElementsByClassName('selected')[0].innerText) {
      $.post('http://DokusCore--Inventory/NotEnoughAmount', JSON.stringify({
        item: document.getElementsByClassName('selected')[0].id
      }));
    } else {
      $.post('http://DokusCore--Inventory/drop', JSON.stringify({
        item: document.getElementsByClassName('selected')[0].id,
        count: Number(document.getElementById('drop-count').value)
      }));

      document.getElementById(`${document.getElementsByClassName('selected')[0].id}`).innerHTML = document.getElementsByClassName('selected')[0].innerText - document.getElementById('drop-count').value;
      if (document.getElementsByClassName('selected')[0].innerHTML == 0) {
        itemSelected.style.display = 'none'
      }
    };
  };

  function clearDocument() {
    $("#drag1").empty();
    $("#drag2").empty();
  };

  // Close the menu when tab or exit is pressed
  document.onkeyup = function(data) {
    const Key = data.which
    console.log(Key);
    // Use Item
    if (Key == 69) {
      var itemSelected = document.getElementsByClassName('selected')[0].id;
      let amount = Number(document.getElementById('drop-count').value)
      $.post('http://DokusCore--Inventory/UseItem', JSON.stringify({
        Item: itemSelected,
        Count: amount
      }));
    };

    // Drop Item
    if (Key == 68) { DropItem() };

    // CLose Inventory
    if (Key == 9 || Key == 27) {
      $('.overlay').hide();
      clearDocument()
      $.post('http://DokusCore--Inventory/NUIFocusOff', JSON.stringify({}));
    };

    // Edit item amount box
    if (Key == 49) { Number(document.getElementById('drop-count').value = 1)  };
    if (Key == 50) { Number(document.getElementById('drop-count').value = 2)  };
    if (Key == 51) { Number(document.getElementById('drop-count').value = 3)  };
    if (Key == 52) { Number(document.getElementById('drop-count').value = 4)  };
    if (Key == 53) { Number(document.getElementById('drop-count').value = 5)  };
    if (Key == 54) { Number(document.getElementById('drop-count').value = 6)  };
    if (Key == 55) { Number(document.getElementById('drop-count').value = 7)  };
    if (Key == 56) { Number(document.getElementById('drop-count').value = 8)  };
    if (Key == 57) { Number(document.getElementById('drop-count').value = 9)  };

  };
});
