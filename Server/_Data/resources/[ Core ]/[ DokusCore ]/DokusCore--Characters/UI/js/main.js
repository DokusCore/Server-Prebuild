// Variables
var Limit = 3;
var Data = null;
var CharID = 0;

// Window
window.addEventListener('message', (event) => {
  var Type = event.data.Type
  var Time = event.data.Time
  Data = event.data.Data
  if (Type == 'Load') { LoadMenu(); };
  if (Type == 'Reload') { window.location.reload(); };
  if (Type == "Show") { $("body").fadeIn(Time); };
  if (Type == "Hide") { $("body").fadeOut(Time); };
});

// Highlight the button that is selected
$(document).on('click', '.char', function(e){
  $(".selected").removeClass("selected");
  e.currentTarget.className += " selected";
});

// Load the menu and filter the buttons
function LoadMenu() {
  $(".loading").html('');
  $(".container").html(`
    <div class="header-text">CHARACTERS</div>
    <div class="description-text">Select or create a new character.</div>
    <div class="main"></div>
    <div class="bottom-line"></div>
    <div class="buttons">
    <div class="enter-world" onclick="EnterWorld()">Enter World</div>
    </div>
  `);

  $.each(Data, function(k,v) {
    Limit--
    $(".main").append(`
      <div class="char ${v.CharID}" onclick="SelectedChar(${v.CharID})">
        <div class="char_name">${v.cName}</div>
      </div>
    `);
  });

  // Create new character if limit is not reached yet
  if (Limit > 0) {
    for (let i = 0; i < Limit; i++){
      $(".main").append(`
        <div class="empty" onclick="NewCharacter()">
          <span>Create Character</span>
        </div>
      `);
    };
  };
};

function SelectedChar(id) {
  CharID = id
  $(".enter-world").css("opacity", "1");
  $.post('http://DokusCore--Characters/SelectedChar', JSON.stringify({ CharID: CharID }));
  return ResetData();
};


function EnterWorld() {
  $(".enter-world").css("opacity", "1");
  $.post('http://DokusCore--Characters/EnterWorld', JSON.stringify({ CharID: CharID }));
  return ResetData()
};

function NewCharacter() {
  $(".enter-world").css("opacity", "1");
  $.post('http://DokusCore--Characters/CreateCharacter', JSON.stringify({ CharID: CharID }));
  return ResetData()
};

function ResetData() {
  setTimeout(function () {
    CharID = 0;
  }, 3000);
};


























//
