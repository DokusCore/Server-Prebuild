var data
var book = document.getElementsByClassName("flipbook")[0]
var frontimage = document.getElementById("frontimage")
var midimage = document.getElementById("midimage")
var backimage = document.getElementById("backimage")
var inited = false
var editable = false
var currentEditingPageIndex
var _editor
var settings
var onClose
var bookIsOpen = false

document.getElementById("closesettingsbutton").onclick = function() {
  SetClass("w_settings", "off")
}

function StartBook(args) {
  if (args == null) {
    return false
  }
  if (args.data == null) {
    return false
  }
  d = args.data
  edit = !!args.edit
  onClose = args.onClose


  SetClass("w_book", "off", false)
  SetClass("w_content", "off", false)

  if (!inited) {
    inited = true
    $('.flipbook').turn({
      width: 922 * 1.5,
      height: 600 * 1.5,
      elevation: 50,
      gradients: true,
      autoCenter: true
    });
  }


  editable = edit
  data = d
  frontimage.value = data.frontImage || "";
  frontimage.onchange = function() {
    data.frontImage = frontimage.value
  }
  midimage.value = data.midImage || "";
  midimage.onchange = function() {
    data.midimage = midimage.value
  }
  backimage.value = data.backImage || "";
  backimage.onchange = function() {
    data.backimage = backimage.value
  }

  if (data == null || data == "" || data.pages == null || data.pages.length == 0) {
    $(".flipbook").turn("addPage", CreatePageElement(editable))
    $(".flipbook").turn("addPage", CreatePageElement(editable))
    $(".flipbook").turn("addPage", CreatePageElement(editable))
  } else {
    BuildPages()
    $(".flipbook").turn("page", 1);
  }
  $(".flipbook").bind("turned", function(event, page, view) {
    document.getElementsByClassName("w_flip")[0].classList.toggle("off", true)
  });

}

function StopBook() {
  SetClass("w_book", "off", true)
  SetClass("w_content", "off", true)
}

function BuildPages() {
  var pageCount = $(".flipbook").turn("pages")
  for (var i = pageCount; i > 0; i--) {
    if ($(".flipbook").turn("hasPage", i) == false) {
      continue
    }
    $(".flipbook").turn("removePage", i);
  }
  for (var i = 0; i < data.pages.length; i++) {
    $(".flipbook").turn("addPage", CreatePageElement(editable, data.pages[i]))
  }
}

function CreatePageElement(editable, data) {

  var element = document.createElement("div")
  element.classList.add("w_bookpage")
  element.id = "bookpage" + ($(".flipbook").turn("pages") + 1)

  if (data != null && data.background != null) {
    element.style.backgroundImage = "url('" + data.background + "')"
  }
  if (data != null && data.backgroundColor != null) {
    element.style.backgroundColor = data.backgroundColor
  }
  if (data != null && data.color != null) {
    element.style.color = data.color
  }

  var cont = document.createElement("div")
  cont.id = "pagecontent" + ($(".flipbook").turn("pages") + 1)
  cont.classList.add("w_pagecontent")
  //cont.classList.add("markdown-body")
  cont.setAttribute("pageIndex", $(".flipbook").turn("pages") + 1)
  cont.innerHTML = data.content || ""
  element.appendChild(cont)


  return element
}



function SetClass(className, otherClassName, enable) {
  if (document.getElementsByClassName(className).length == 1) {
    document.getElementsByClassName(className)[0].classList.toggle(otherClassName, enable)
  } else {
    document.getElementById(className).classList.toggle(otherClassName, enable)
  }
}


function index(page) {
  $(".flipbook").turn("page", page);
}

window.addEventListener('message', function(event) {
  if (event.data.type == "Hide") { $('.flipbook').fadeOut(500); };
  if (event.data.type == "Show") { $('.flipbook').fadeIn(500); };

  if (event.data.type == "OpenBookGui") {
    if (event.data.value == true) {
      //DebugInit(true)
      var url = new URL(window.location.href);
      StartBook({
        data: {
          pages: [{
              /* 1 cover */
              content: "<div>  <div class=\"HomeBanner__imgWrap__ytSx9\"><img src=\"Assets/IMG/page1.png\" alt=\"Wheeler, Rawson and Co.\" class=\"HomeBanner__img__1bLBq\" tabindex=\"0\"></div>",
              background: "Assets/IMG/leather.jpg",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 2 index */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <h2 class=\"index_header\">INDEX</h2>  <div class=\"ProductPurchaseButtons__button__index__handguns\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"index(4)\" type=\"button\">             <span class=\"Button__text__index\">Handguns</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__index__repeaters\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"index(12)\" type=\"button\">             <span class=\"Button__text__index\">Repeaters</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__index__rifles\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"index(17)\" type=\"button\">             <span class=\"Button__text__index\">Rifles</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__index__shotguns\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"index(22)\" type=\"button\">             <span class=\"Button__text__index\">Shotguns</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__index__misc\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"index(28)\" type=\"button\">             <span class=\"Button__text__index\">Miscellaneous</span>         </button>     </div></div>",
              background: "Assets/IMG/background.jpg",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 3 ad */
              content: "<img class = \"ad\" src=\"Assets/IMG/page2.png\" alt=\"gun\" tabindex=\"0\">",
              background: "Assets/IMG/background.jpg",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 4 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REVOLVER_CATTLEMAN',0)\" type=\"button\">             <span class=\"Button__text__2C2ug\">$06.75 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REVOLVER_CATTLEMAN',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page3.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 5 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REVOLVER_DOUBLEACTION',0)\" type=\"button\">             <span class=\"Button__text__2C2ug\">$05.35 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REVOLVER_DOUBLEACTION',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: 'Assets/IMG/page4.png',
              backgroundColor: "",
              color: "",
            },
            {
              /* 6 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REVOLVER_SCHOFIELD',0)\" type=\"button\">             <span class=\"Button__text__2C2ug\">$07.70 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REVOLVER_SCHOFIELD',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page5.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 7 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REVOLVER_LEMAT')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$10.17 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REVOLVER_LEMAT',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page7.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 8 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_PISTOL_VOLCANIC')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$08.75 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_PISTOL_VOLCANIC',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page8.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 9 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_PISTOL_SEMIAUTO')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$06.75 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_PISTOL_SEMIAUTO',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page9.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 10 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_PISTOL_MAUSER')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$07.55 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_PISTOL_MAUSER',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page10.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 11 ad */
              content: "<img class = \"ad\" src=\"Assets/IMG/page11.png\" alt=\"gun\" tabindex=\"0\">",
              background: "Assets/IMG/background.jpg",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 12 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REPEATER_CARBINE')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$15.75 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REPEATER_CARBINE',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page12.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 13 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REPEATER_WINCHESTER')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$10.50 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REPEATER_WINCHESTER',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page13.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 14 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REPEATER_EVANS')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$09.25 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REPEATER_EVANS',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page14.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 15 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REPEATER_HENRY')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$17.25 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_REPEATER_HENRY',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page15.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 16 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_RIFLE_VARMINT')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$07.75 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_RIFLE_VARMINT',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page16.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 17 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_RIFLE_SPRINGFIELD')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$19.30 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_RIFLE_SPRINGFIELD',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page17.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 18 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_RIFLE_BOLTACTION')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$20.00 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_RIFLE_BOLTACTION',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page18.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 19 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SNIPERRIFLE_ROLLINGBLOCK')\" type=\"button\">             <span class=\"Button__text__2C2ug\">22.25 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SNIPERRIFLE_ROLLINGBLOCK',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page19.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 20 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SNIPERRIFLE_CARCANO')\" type=\"button\">             <span class=\"Button__text__2C2ug\">25.75 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SNIPERRIFLE_CARCANO',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page20.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 21 ad */
              content: "<img class = \"ad\" src=\"Assets/IMG/page21.png\" alt=\"ad\" tabindex=\"0\">",
              background: "Assets/IMG/background.jpg",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 22 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SHOTGUN_SAWEDOFF')\" type=\"button\">             <span class=\"Button__text__2C2ug\">15.00 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SHOTGUN_SAWEDOFF',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page22.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 23 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SHOTGUN_DOUBLEBARREL')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$17.00 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SHOTGUN_DOUBLEBARREL',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page23.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 24 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SHOTGUN_PUMP')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$21.25 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SHOTGUN_PUMP',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page24.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 25 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SHOTGUN_REPEATING')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$21.75 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SHOTGUN_REPEATING',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page25.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 26 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SHOTGUN_SEMIAUTO')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$20.30 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_SHOTGUN_SEMIAUTO',1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page26.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 27 ad */
              content: "<img class = \"ad\" src=\"Assets/IMG/page27.png\" alt=\"ad\" tabindex=\"0\">",
              background: "Assets/IMG/background.jpg",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 28 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__1Vwwn\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_BOW')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$03.15 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br>     <div class=\"ProductPurchaseButtons__button__ammo\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_BOW',1,1)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"cattermanammo\">$1.25 Ammo</span>         </button>     </div>  <div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page28.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 29 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_LASSO')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$00.70 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br> <div class=\"ProductPurchaseButtons__button__back__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page34.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 30 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_MELEE_BROKEN_SWORD')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$02.35 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br> <div class=\"ProductPurchaseButtons__button__back__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page29.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 31 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_MELEE_LANTERN')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$01.20 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br> <div class=\"ProductPurchaseButtons__button__back__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page30.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 32 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_MELEE_HATCHET')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$01.25 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br> <div class=\"ProductPurchaseButtons__button__back__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page31.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 33 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_MELEE_KNIFE')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$01.15 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br> <div class=\"ProductPurchaseButtons__button__back__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page32.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 34 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_THROWN_THROWING_KNIVES')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$01.50 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br> <div class=\"ProductPurchaseButtons__button__back__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page33.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 35 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_MELEE_MACHETE')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$02.75 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br> <div class=\"ProductPurchaseButtons__button__back__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page35.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 36 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_THROWN_TOMAHAWK')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$02.55 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br> <div class=\"ProductPurchaseButtons__button__back__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/page36.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 37 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_THROWN_DYNAMITE')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$03.00 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br> <div class=\"ProductPurchaseButtons__button__back__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/dynamite.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 38 */
              content: "<div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <div class=\"ProductPurchaseButtons__button__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"buyNow\" onclick=\"Buy('WEAPON_THROWN_MOLOTOV')\" type=\"button\">             <span class=\"Button__text__2C2ug\">$02.15 Buy</span>         </button>     </div></div><br><div class=\"ProductPurchaseButtons__buttons__14Q7z\">  <br> <div class=\"ProductPurchaseButtons__button__back__melee\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\">             <span class=\"Button__text__2C2ug\" id=\"back\">Index</span>         </button>     </div></div>",
              background: "Assets/IMG/firebottle.png",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /* 39 ad */
              content: "<img class = \"ad\" src=\"Assets/IMG/page39.png\" alt=\"ad\" tabindex=\"0\">",
              background: "Assets/IMG/background.jpg",
              backgroundColor: "#353535",
              color: "white",
            },
            {
              /*  back-side*/
              content: "<div>  <img class = \"ad\" src=\"Assets/IMG/back.png\" alt=\"ad\" tabindex=\"0\">  <p class=\"credits\">Made by Steady and Erratic. RIP Depth.</p></div>",
              background: "Assets/IMG/leather.jpg",
              backgroundColor: "#353535",
              color: "white",
            },
          ],
        },
        edit: (url.searchParams.get("edit") != null),
      })
      bookIsOpen = true
    } else if (event.data.value === false) {
      if (bookIsOpen) {
        StopBook()
      }
    }
  }

})


$(document).keydown(function(e) {
  var previous = 37,
    next = 39,
    close = 27,
    close2 = 8;
  switch (e.keyCode) {
    case previous:
      $('.flipbook').turn('previous');
      break;
    case next:
      $('.flipbook').turn('next');
      break;
    case close:
      Post('http://DokusCore--GunStore/CloseMenu')
      break;
    case close2:
      Post('http://DokusCore--GunStore/CloseMenu')
      break;
  }
});


function Buy(Weapon, IsAmmo) {
  if ((IsAmmo == 0) || (IsAmmo == undefined) || (IsAmmo == null)) {
    Post('http://DokusCore--GunStore/BuyWeapon', Weapon)
  } else {
    Post('http://DokusCore--GunStore/BuyAmmo', Weapon)
  }
}

Post = function(url, data) {
  var d = (data ? data : {});
  $.post(url, JSON.stringify(d));
};
