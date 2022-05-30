// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
// ------------------------------- DokusCore -------------------------------- \\
// -------------------------------------------------------------------------- \\
// ---------------------------- Made by DevDokus ---------------------------- \\
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
const axios = require('axios').default;
const ms = require('ms');
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
// --- Discord Bot Credentionals
const ID    = "701963127620894762"  // -- This is your server ID
const Token = "OTcwOTYwMzM5MzYzNTkwMTY2.GWGghX.GPphQdGRf3Jyt0QKCoKdkrLqV2873qTXQzgoYI"  // -- This is your Discord bot token
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
var Roles = [
  { Name: 'Starlet Sidney', RoleID: 871470075507511336 }
];
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
var Reset = "\x1b[0m";
var Bright = "\x1b[1m";
var Blink = "\x1b[5m";
var FgRed = "\x1b[31m";
var FgGreen = "\x1b[32m";
var FgYellow = "\x1b[33m";
var FgBlue = "\x1b[34m";
var FgMagenta = "\x1b[35m";
var FgCyan = "\x1b[36m";
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
// -- Connect to the Discord server.
// -------------------------------------------------------------------------- \\
setTimeout(async () => {
  let ABC = await axios({
    method: 'GET',
    url: `https://discord.com/api/v9/users/@me`,
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bot ${Token}`
    },
  }).catch(async (err) => {
    APIError()
    await Delay(2)
    // process.exit(1);
  });

  if (ABC != undefined) {
    APIAccess()
    
  };

}, 2000);
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
// -- Check if user is within our Discord
// -------------------------------------------------------------------------- \\
IsInDiscord = async function(User, cb) {
  var Data = true
  let Check = await axios({
    method: 'GET',
    url: `https://discord.com/api/v9/guilds/${ID}/members/${User}`,
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bot ${Token}`
    },
  }).catch(async (err) => {
    Data = false
    return cb(Data)
  });
  Data = true
  return cb(Data)
};
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\























// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
function Delay(n){
  return new Promise(function(resolve) {
    setTimeout(resolve,n*1000);
  });
};
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
function APIError() {
  console.log('');
  console.log(Bright, Blink, FgRed, '--------------------------------------------------------------', Reset);
  console.log(Bright, Blink, FgRed, '-', Reset, FgYellow, '              ~~ Special Access Error! ~~', FgRed, Blink, '             -', Reset);
  console.log(Bright, Blink, FgRed, '--------------------------------------------------------------', Reset);
  console.log(Bright, Blink, FgRed, '-', Reset, FgCyan, 'Special Access is unable to lay an connection with the', FgRed, Blink, '-', Reset);
  console.log(Bright, Blink, FgRed, '-', Reset, FgCyan, '       Discord Service API. Is the token right?', FgRed, Blink, '       -', Reset);
  console.log(Bright, Blink, FgRed, '-', Reset, FgCyan, '          It could be that Discord is down!.', FgRed, Blink, '          -', Reset);
  console.log(Bright, Blink, FgRed, '--------------------------------------------------------------', Reset);
};
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
function APIAccess() {
  console.log('');
  console.log(Bright, Blink, FgGreen, '--------------------------------------------------------------', Reset);
  console.log(Bright, Blink, FgGreen, '-', Reset, FgYellow, '                 ~~ Special Access! ~~', FgGreen, Blink, '                -', Reset);
  console.log(Bright, Blink, FgGreen, '-', Reset, FgGreen, '                     ~~ DevDokus ~~', FgGreen, Blink, '                   -', Reset);
  console.log(Bright, Blink, FgGreen, '--------------------------------------------------------------', Reset);
  console.log(Bright, Blink, FgGreen, '-', Reset, FgCyan, '       UnchainedRP Is awesome, and you know it!', FgGreen, Blink, '       -', Reset);
  console.log(Bright, Blink, FgGreen, '--------------------------------------------------------------', Reset);
};
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
