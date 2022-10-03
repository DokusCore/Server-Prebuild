function confirm(){
    $.post('http://DokusCore--Stables/CloseStable')
    $('#button-customization').addClass("disabled");
    $('#page_myhorses .scroll-container .collapsible').html('');
    $('#page_shop .scroll-container .collapsible').html('');
    $("#creatormenu").fadeOut(3000);
}

function buyHorse(Model, Price, IsStock) {
  if (IsStock) {
    $.post('http://DokusCore--Stables/ShowInStock', JSON.stringify({}));
  } else {
    $.post('http://DokusCore--Stables/BuyHorse', JSON.stringify({ Model: Model, Price: Price }));
  }
}

function CloseMenu() {
  $('#button-customization').addClass("disabled");
  $('#page_myhorses .scroll-container .collapsible').html('');
  $('#page_shop .scroll-container .collapsible').html('');
  $("#creatormenu").fadeOut(3000);
}

function SelectHorse(ID, Name) {
  $.post('http://DokusCore--Stables/SelectHorse', JSON.stringify({ ID: ID, Name: Name }))
}

function SellHorse(ID, Name) {
  $.post('http://DokusCore--Stables/SellHorse', JSON.stringify({ ID: ID, Name: Name }))
  // $('#button-customization').addClass("disabled");
  // $('#page_myhorses .scroll-container .collapsible').html('');
  // $('#page_shop .scroll-container .collapsible').html('');
  // $("#creatormenu").fadeOut(3000);
}

function RentOutHorse(ID, Name) {
  $.post('http://DokusCore--Stables/RentOutHorse', JSON.stringify({ ID: ID, Name: Name }))
  // $('#button-customization').addClass("disabled");
  // $('#page_myhorses .scroll-container .collapsible').html('');
  // $('#page_shop .scroll-container .collapsible').html('');
  // $("#creatormenu").fadeOut(3000);
}

function TakeOutHorse(ID, Name) {
  $.post('http://DokusCore--Stables/SelectHorse', JSON.stringify({ ID: ID, Name: Name }))
  $('#button-customization').addClass("disabled");
  $('#page_myhorses .scroll-container .collapsible').html('');
  $('#page_shop .scroll-container .collapsible').html('');
  $("#creatormenu").fadeOut(3000);
  setTimeout(function () {
    $.post('http://DokusCore--Stables/TakeOutHorse', JSON.stringify({ ID: ID, Name: Name }))
  }, 1000);
}

function AskForBasicCare(ID, Name) {
  $.post('http://DokusCore--Stables/AskForBasicCare', JSON.stringify({ ID: ID, Name: Name }))
}

function DoBasicNeeds(ID, Name) {
  $.post('http://DokusCore--Stables/DoBasicNeeds', JSON.stringify({ ID: ID, Name: Name }))
}

function TrainMyHorse(ID, Name) {
  $.post('http://DokusCore--Stables/TrainMyHorse', JSON.stringify({ ID: ID, Name: Name }))
}

function minTwoDigits(n) {
  return (n < 10 ? '0' : '') + n;
}
