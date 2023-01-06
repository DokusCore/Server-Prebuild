let selectedPlayer = 0;
let players = [];
let Buttons = {
    "dv":     true,
    "noclip": true,
    "ghost":  true,
    "coords": true,
    // "announce": false,
    // "clear-area": false,
    "tpm": true,
    "dm": true,
    // "goto": false,
    // "bring": false,
    "warn": true,
    // "chain": false,
    // "slap": false,
    // "slay": false,
    // "kick": false,
    // "ban": false,
    // "job": false,
    // "money": false,
    // "gold": false,
    // "perms": false,
    // "heal": false,
    // "spectate": false
}

$(function(){
    insertPlayerList(players)
    window.addEventListener('message', function(event) {
        if(event.data.type == "open"){
            insertPlayerList(event.data.players);
            players = event.data.players;
            _open()
        }
        else if(event.data.type == "close"){ _close() }
        else if(event.data.type == "coords") {document.execCommand("copy", false, event.data.data)}
    })
})

// Open admin panel
function _open() {
    SetButtons()
    document.getElementById("bg").classList.toggle("show");
    document.getElementById("panel").classList.toggle("show");
    removePlayer();
}

function _close() {
    UnsetButtons();
    document.getElementById("bg").classList.toggle("show");
    document.getElementById("panel").classList.toggle("show");
    $.post('http://DokusCore--AdminMenu/close', JSON.stringify({}));
}

function SetButtons() {
    for (_key in Buttons) {

      if ((Buttons[_key] == true) || (_key != null)) {
        console.log('SetButtons', Buttons[_key], _key)
        document.getElementById(_key).removeAttribute("disabled")
      }
    }
}

function UnsetButtons() {
    for (_key in Buttons) {

      if ((Buttons[_key] == false) || (_key != null)) {
        console.log('UnSetButtons', Buttons[_key], _key)
        document.getElementById(_key).setAttribute("disabled","")
      }
    }
}

//-----------------------
// Button presses
//-----------------------
// View player button
function viewPlayer(_id) {
    selectedPlayer = _id

    document.getElementById('info-id').innerHTML = players[_id].id
    document.getElementById('info-name').innerHTML = players[_id].name
    document.getElementById('info-steam').innerHTML = players[_id].steam

    document.getElementById('no-player-selected').classList.add("hide")
    document.getElementById('player-selected').classList.remove("hide")

}

// Remove slected player
function removePlayer() {
    selectPlayer = 999;

    document.getElementById('no-player-selected').classList.remove("hide")
    document.getElementById('player-selected').classList.add("hide")
}


// Delete vehicle
function dv() { $.post('http://DokusCore--AdminMenu/dv', JSON.stringify({})) }

// Toggle Noclip
function toggleNoclip() { $.post('http://DokusCore--AdminMenu/noclip', JSON.stringify({})) }

function tpm() { $.post('http://DokusCore--AdminMenu/TPM', JSON.stringify({})) }

// Toggle Ghost
function toggleGhost() { $.post('http://DokusCore--AdminMenu/ghost', JSON.stringify({})) }

// Copy Coords
function coords() { $.post('http://DokusCore--AdminMenu/coords', JSON.stringify({})) }

// Announce
function announce() { modalShow("announce", "Global Announce", "Enter a message below to send a global announcement to all players.", 0, true) }

// Clear Area
function clearArea() { $.post('http://DokusCore--AdminMenu/clearArea', JSON.stringify({})) }


// Direct message
function directMessage() { modalShow("directMessage", "Direct Message", "Send a player a direct message in text chat", 0, true) }

// Goto player
function goto() { $.post('http://DokusCore--AdminMenu/goto', JSON.stringify({player:players[selectedPlayer].id})) }

// Bring player
function bring() { $.post('http://DokusCore--AdminMenu/bring', JSON.stringify({player:players[selectedPlayer].id})) }

// Warn player
function warn() { modalShow("warn", "Warn Player", "Warn a player with a mesage. This message will be displayed for 1 minute", 1, true) }

// Chain player
function chain() { $.post('http://DokusCore--AdminMenu/chain', JSON.stringify({player:players[selectedPlayer].id})) }

// Slap player
function slap() { $.post('http://DokusCore--AdminMenu/slap', JSON.stringify({player:players[selectedPlayer].id})) }

// Slay player
function slay() { $.post('http://DokusCore--AdminMenu/slay', JSON.stringify({player:players[selectedPlayer].id})) }

// Kick player
function kick() { modalShow("kick", "Kick Player", "Kick player from server. Enter your reason below.", 2, true) }

// Ban player
function ban() { modalShow("ban", "Ban Player", "Ban player from server. Enter your reason below.", 2, true) }

// Set players job
function setJob() {  }

// Edit players money
function editMoney() {  }

// Edit players gold
function editGold() {  }

// Set players staff perms
function staffPerms() {  }

//-----------------------
// Modal
//-----------------------

/**
 * This will open the modal and edit content  depending on params.
 * @param   {string}  _action      what function to declare, set null to not complete action
 * @param   {string}    _title       declare the title of modal
 * @param   {string}    _body        declare sub text to display, usually description
 * @param   {int}       _style       0: info, 1: warning, 2: danger
 * @param   {boolean}   _input       true: text box if no inputArgs set, false: no input just text
 * @param   {string}    _inputName   if set changes continue button to 'inputName'
 * @param   {array}     _inputArgs   if set will change input text box to a dropdown menu
 * @returns {function}              enables modal and passes 'action' and 'input' to
 */
function modalShow(_action, _title, _body, _style, _input, _inputName, _inputArgs) {
    document.getElementById('modal-div').classList.toggle("hide");
    document.getElementById('modal').classList.toggle("hide");
    document.getElementById('modal-bg').classList.toggle("hide");

    // Set modal title
    document.getElementById('modal-title').innerHTML = _title;

    // Set modal body
    document.getElementById('modal-body').innerHTML = _body;

    // Set modal style
    if (_style == 0) {      // Info styling
        document.getElementById('modal-icon-info').classList.remove("hide")
    }
    else if (_style == 1) {// Warning styling
        document.getElementById('modal-icon-warning').classList.remove("hide")
    }
    else if (_style == 2) {// Danger styling
        document.getElementById('modal-icon-danger').classList.remove("hide")
    }

    // Set input
    if (_input) {
        if (_inputArgs) { document.getElementById('modal-input').innerHTML = inputDropdown() }
        else { document.getElementById('modal-input').innerHTML = inputTextbox() }
    }

    // Set confirm button click
    if (_action != null) { document.getElementById('modal-confirm').setAttribute('onclick', `modalHide("${_action}")`) }
    else { document.getElementById('modal-confirm').setAttribute('onclick', `modalHide()`) }

    // Set confirm button text
    if (_inputName) { document.getElementById('modal-confirm').innerHTML = _inputName }
    else { document.getElementById('modal-confirm').innerHTML = "Confirm" }

}

// Modal close or do action
function modalHide(_action) {

    let data = document.getElementById('modal-data').value

    if (typeof _action == "string") {
        if (data != "" || data != null) { $.post(`http://DokusCore--AdminMenu/${_action}`, JSON.stringify({data:data, player:players[selectedPlayer].id})) }
        else { $.post(`http://DokusCore--AdminMenu/${_action}`, JSON.stringify({player:players[selectedPlayer].id})) }
    }
    else if (_action != null) { console.error(`action needs to be type: 'string'. Action was type: '${typeof _action}'`)}

    document.getElementById('modal').classList.toggle("hide");
    document.getElementById('modal-bg').classList.toggle("hide");
    document.getElementById('modal-div').classList.toggle("hide");
    document.getElementById('modal-icon-info').classList.add("hide")
    document.getElementById('modal-icon-warning').classList.add("hide")
    document.getElementById('modal-icon-danger').classList.add("hide")

}


//-----------------------
// Player list things
//-----------------------

// Insert HTML into #player-list
function insertPlayerList(players) {
    let _players = ""
    let playerList = document.getElementById('player-list');
    for (var i in players) {
        _players += playerBox(i, players[i].id, players[i].name, players[i].steam);
    }
    playerList.innerHTML = _players
}


//-----------------------
// HTML element triggers
//-----------------------

// Player box
function playerBox(_id, id, username, steamid) {
return `<li class="py-4"><div class="flex items-center space-x-4"><div class="flex-shrink-0"><h1 class="h-8 w-8 text-gray-200 text-center">${id}</h1></div><div class="flex-1 min-w-0"><p class="text-sm font-medium text-gray-200 truncate">${username}</p><p class="text-sm text-gray-500 truncate">${steamid}</p></div><div><button onclick="viewPlayer(${_id})" class="inline-flex items-center shadow-sm px-2.5 py-0.5 text-sm leading-5 rounded-full bg-blue-800 border-blue-800 border-2 border-transparent hover:border-blue-400 hover:bg-blue-700 text-White"> View </button></div></div></li>`;
}

function inputTextbox() {
    let html = `
    <div class="mt-1">
        <input  type="text" id="modal-data" name="data" rows="3" class="shadow-sm focus:ring-sky-500 focus:border-sky-500 mt-1 block w-full sm:text-sm border border-gray-300 rounded-md p-2">
    </div>
    `
    return html
}

// function inputDropdown() {
//     let html = `
//     <div class="mt-1">
//         <text id="modal-data" name="data" rows="3" class="shadow-sm focus:ring-sky-500 focus:border-sky-500 mt-1 block w-full sm:text-sm border border-gray-300 rounded-md p-2"></text>
//     </div>
//     `
//     return html
// }
