(function () {
    let MenuTpl =
        '<div id="menu_{{_namespace}}_{{_name}}" style="height: 90%;width: 25%;" class="menu{{#align}} align-{{align}}{{/align}}">' +
        '<div class="head"><span>{{{title}}}</span></div>' +
        '<div class="desciption">{{{subtext}}}</div>' +
        '<div class="topline"></div>' +
        '<div class="menu-items" style="height: 60%;max-height: unset;">' +

        '{{#elements}}' +
        '<div class="menu-item {{#selected}}selected{{/selected}} {{#isSlider}}slider{{/isSlider}} {{#isText}}text{{/isText}}">' +
        //"nui://redemrp_inventory/html/"..(l.meta.resim or v.image) ..".png"
        '{{#image}}<img style="width: 50px;height: 50px;background-blend-mode: screen;background-repeat: round;align-content: center;padding: 10px;" src="{{{image}}}">{{/image}}' +
        '{{^isText}}<div id="item-label">{{{label}}}</div>{{/isText}}' +
        '{{#isText}}<div class="inputtext" style="width: 100%;height: 100%;">' +
        '<input id="{{{list_id}}}" type="text" oninput="rendertext(this)"style="width: 100%;height: 100%;background: transparent;border: none;color: white;    font-family: \'crock\';font-size: 15px;" placeholder="{{{label}}}">' +
        '</div>{{/isText}}' +
        '{{#isSlider}}<div class="arrows">' +
        '<i class="fas fa-chevron-left"></i>' +
        '<div id="slider-label">{{{sliderLabel}}}</div>' +
        '<i class="fas fa-chevron-right"></i>' +
        '</div>{{/isSlider}}' +
        '</div>' +

        '{{/elements}}' +
        '</div>' +
        '<div class="scrollbottom"></div>' +
        '{{#elements}}' +
        '{{#selected}}' +
        '<div class="options-amount">{{{list_id}}}/{{{list_max}}}</div>' +
        //'<br>'+
        '<div style="display: flex;align-items: center;justify-content: space-evenly;flex-direction: column;align-content: center;margin:10px">' +
        '<div class="images" style="display: flex;flex-wrap: wrap;justify-content: center;flex-direction: row;width: 100%;">' +
        '{{#descriptionimages}}' +
        '<div style="display: flex;flex-wrap: wrap;flex-direction: column;align-items: flex-end;margin: 5px">' +
        '<span style="position: absolute;">{{{count}}}</span>' +
        '<img style="width: 60px;height: 60px;background-image: url(nui://redemrp_inventory/html/slot-bk.png);background-blend-mode: screen;background-repeat: round;align-content: center;padding: 10px;" src={{{src}}}>' +
        '<span style="width: 100%;text-align: center;">{{{text}}}</span>' +
        '</div>' +
        '{{/descriptionimages}}' +
        '</div>' +
        '<div class="desciption">{{{desc}}}</div>' +
        '</div>' +
        '{{/selected}}' +
        '{{/elements}}' +
        '<br>' +
        '</div>' +
        '</div>'
        ;
    window.MenuData = {};
    MenuData.ResourceName = 'redemrp_menu_base';
    MenuData.opened = {};
    MenuData.focus = [];
    MenuData.pos = {};

    MenuData.open = function (namespace, name, data) {
        if (typeof MenuData.opened[namespace] == 'undefined') {
            MenuData.opened[namespace] = {};
        }

        if (typeof MenuData.opened[namespace][name] != 'undefined') {
            MenuData.close(namespace, name);
        }

        if (typeof MenuData.pos[namespace] == 'undefined') {
            MenuData.pos[namespace] = {};
        }

        for (let i = 0; i < data.elements.length; i++) {
            if (typeof data.elements[i].type == 'undefined') {
                data.elements[i].type = 'default';
            }
        }

        data._index = MenuData.focus.length;
        data._namespace = namespace;
        data._name = name;

        for (let i = 0; i < data.elements.length; i++) {
            data.elements[i]._namespace = namespace;
            data.elements[i]._name = name;
        }

        MenuData.opened[namespace][name] = data;
        MenuData.pos[namespace][name] = 0;

        for (let i = 0; i < data.elements.length; i++) {
            if (data.elements[i].selected) {
                MenuData.pos[namespace][name] = i;
            } else {
                data.elements[i].selected = false;
            }
        }

        MenuData.focus.push({
            namespace: namespace,
            name: name
        });

        MenuData.render();
        $('#menu_' + namespace + '_' + name).find('.menu-item.selected')[0].scrollIntoView();
    };

    MenuData.close = function (namespace, name) {
        delete MenuData.opened[namespace][name];

        for (let i = 0; i < MenuData.focus.length; i++) {
            if (MenuData.focus[i].namespace == namespace && MenuData.focus[i].name == name) {
                MenuData.focus.splice(i, 1);
                break;
            }
        }

        MenuData.render();
    };

    MenuData.render = function () {
        let menuContainer = document.getElementById('menus');
        let focused = MenuData.getFocused();
        menuContainer.innerHTML = '';
        $(menuContainer).hide();
        for (let namespace in MenuData.opened) {
            for (let name in MenuData.opened[namespace]) {
                let menuData = MenuData.opened[namespace][name];
                let view = JSON.parse(JSON.stringify(menuData));
                for (let i = 0; i < menuData.elements.length; i++) {
                    let element = view.elements[i];
                    if (element.image) {
                        if (element.image.includes("https://")) {

                        } else if (element.image.includes(".png")) {
                            element.image = "nui://redemrp_inventory/html/" + element.image;
                        }
                        else {
                            element.image = "nui://redemrp_inventory/html/" + element.image + ".png";
                        }
                    }
                    switch (element.type) {
                        case 'default':
                            element.list_id = i + 1;
                            element.list_max = menuData.elements.length;
                            break;

                        case 'slider': {
                            element.isSlider = true;
                            element.list_id = i + 1;
                            element.list_max = menuData.elements.length;
                            element.sliderLabel = (typeof element.options == 'undefined') ? element.value : element.options[element.value];

                            break;
                        }
                        case 'text': {
                            element.isText = true;
                            element.list_id = i + 1;
                            element.list_max = menuData.elements.length;
                            element.textPlaceHolder = (typeof element.options == 'undefined') ? element.value : element.options[element.value];
                            break;
                        }
                        default:
                            element.list_id = i + 1;
                            element.list_max = menuData.elements.length;
                            break;
                    }

                    if (i == MenuData.pos[namespace][name]) {
                        element.selected = true;
                    }
                }

                let menu = $(Mustache.render(MenuTpl, view))[0];
                $(menu).hide();
                menuContainer.appendChild(menu);
            }
        }

        if (typeof focused != 'undefined') {
            $('#menu_' + focused.namespace + '_' + focused.name).show();
        }

        $(menuContainer).show();

    };

    MenuData.submit = function (namespace, name, data) {
        data.selected = true;
        $.post('https://' + MenuData.ResourceName + '/menu_submit', JSON.stringify({
            _namespace: namespace,
            _name: name,
            current: data,
            elements: MenuData.opened[namespace][name].elements
        }));
    };

    MenuData.cancel = function (namespace, name) {
        $.post('https://' + MenuData.ResourceName + '/menu_cancel', JSON.stringify({
            _namespace: namespace,
            _name: name,
        }));
    };

    MenuData.change = function (namespace, name, data) {
        $.post('https://' + MenuData.ResourceName + '/menu_change', JSON.stringify({
            _namespace: namespace,
            _name: name,
            current: data,
            elements: MenuData.opened[namespace][name].elements
        }));
    };

    MenuData.getFocused = function () {
        return MenuData.focus[MenuData.focus.length - 1];
    };

    window.onData = (data) => {
        switch (data.ak_menubase_action) {

            case 'openMenu': {
                MenuData.open(data.ak_menubase_namespace, data.ak_menubase_name, data.ak_menubase_data);
                break;
            }

            case 'closeMenu': {
                MenuData.close(data.ak_menubase_namespace, data.ak_menubase_name);
                break;
            }

            case 'controlPressed': {
                switch (data.ak_menubase_control) {

                    case 'ENTER': {
                        let focused = MenuData.getFocused();

                        if (typeof focused != 'undefined') {
                            let menu = MenuData.opened[focused.namespace][focused.name];
                            let pos = MenuData.pos[focused.namespace][focused.name];
                            let elem = menu.elements[pos];

                            if (menu.elements.length > 0) {
                                MenuData.submit(focused.namespace, focused.name, elem);
                            }
                        }

                        break;
                    }

                    case 'BACKSPACE': {
                        let focused = MenuData.getFocused();

                        if (typeof focused != 'undefined') {
                            MenuData.cancel(focused.namespace, focused.name);
                        }

                        break;
                    }

                    case 'TOP': {
                        up();
                        break;
                    }

                    case 'DOWN': {
                        down();
                        break;
                    }

                    case 'LEFT': {
                        let focused = MenuData.getFocused();

                        if (typeof focused != 'undefined') {
                            let menu = MenuData.opened[focused.namespace][focused.name];
                            let pos = MenuData.pos[focused.namespace][focused.name];
                            let elem = menu.elements[pos];

                            switch (elem.type) {
                                case 'default':
                                    break;

                                case 'slider': {
                                    let min = (typeof elem.min == 'undefined') ? 0 : elem.min;
                                    if (elem.value > min) {
                                        if (typeof elem.hop != 'undefined') {
                                            elem.value = (elem.value - elem.hop);
                                            if (elem.value < min) {
                                                elem.value = min
                                            }
                                        }
                                        else {
                                            elem.value--;
                                        }
                                        MenuData.change(focused.namespace, focused.name, elem);
                                    }

                                    MenuData.render();
                                    break;
                                }

                                default:
                                    break;
                            }

                            $('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
                        }

                        break;
                    }

                    case 'RIGHT': {
                        let focused = MenuData.getFocused();

                        if (typeof focused != 'undefined') {
                            let menu = MenuData.opened[focused.namespace][focused.name];
                            let pos = MenuData.pos[focused.namespace][focused.name];
                            let elem = menu.elements[pos];

                            switch (elem.type) {
                                case 'default':
                                    break;

                                case 'slider': {
                                    if (typeof elem.options != 'undefined' && elem.value < elem.options.length - 1) {
                                        elem.value++;
                                        MenuData.change(focused.namespace, focused.name, elem);
                                    }

                                    if (typeof elem.max != 'undefined' && elem.value < elem.max) {

                                        if (typeof elem.hop != 'undefined') {
                                            let min = (typeof elem.min == 'undefined') ? 0 : elem.min;
                                            if (min > 0 && min == elem.value) {
                                                elem.value = 0;
                                            }
                                            elem.value = (elem.value + elem.hop);
                                            if (elem.value > elem.max) {
                                                elem.value = elem.max
                                            }
                                        }
                                        else {
                                            elem.value++;
                                        }
                                        MenuData.change(focused.namespace, focused.name, elem);
                                    }

                                    MenuData.render();
                                    break;
                                }

                                default:
                                    break;
                            }

                            $('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
                        }

                        break;
                    }

                    default:
                        break;
                }

                break;
            }
        }
    };

    window.onload = function (e) {
        window.addEventListener('message', (event) => {
            onData(event.data);
        });
    };

})();

function rendertext(sthis) {
    let focused = MenuData.getFocused();
    let menu = MenuData.opened[focused.namespace][focused.name];
    let pos = MenuData.pos[focused.namespace][focused.name];
    let elem = menu.elements[pos];
    elem.value = sthis.value;
    //MenuData.change(focused.namespace, focused.name, elem);
    MenuData.render();
};

function down() {
    let focused = MenuData.getFocused();
    if (typeof focused != 'undefined') {
        let menu = MenuData.opened[focused.namespace][focused.name];
        let pos = MenuData.pos[focused.namespace][focused.name];
        let length = menu.elements.length;

        if (pos < length - 1) {
            MenuData.pos[focused.namespace][focused.name]++;
        } else {
            MenuData.pos[focused.namespace][focused.name] = 0;
        }

        let elem = menu.elements[MenuData.pos[focused.namespace][focused.name]];

        for (let i = 0; i < menu.elements.length; i++) {
            if (i == MenuData.pos[focused.namespace][focused.name]) {
                menu.elements[i].selected = true;
            } else {
                menu.elements[i].selected = false;
            }
        }

        MenuData.change(focused.namespace, focused.name, elem);
        MenuData.render();
        $.post('https://' + MenuData.ResourceName + '/playsound', JSON.stringify({
            type: elem.type
        }));

        $('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
    }
}

function up() {
    let focused = MenuData.getFocused();
    if (typeof focused != 'undefined') {
        let menu = MenuData.opened[focused.namespace][focused.name];
        let pos = MenuData.pos[focused.namespace][focused.name];

        if (pos > 0) {
            MenuData.pos[focused.namespace][focused.name]--;
        } else {
            MenuData.pos[focused.namespace][focused.name] = menu.elements.length - 1;
        }

        let elem = menu.elements[MenuData.pos[focused.namespace][focused.name]];

        for (let i = 0; i < menu.elements.length; i++) {
            if (i == MenuData.pos[focused.namespace][focused.name]) {
                menu.elements[i].selected = true;
            } else {
                menu.elements[i].selected = false;
            }
        }

        MenuData.change(focused.namespace, focused.name, elem);
        MenuData.render();
        $.post('https://' + MenuData.ResourceName + '/playsound', JSON.stringify({
            type: elem.type
        }));
        if (elem.type === "text") {

        }
        $('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
    }
}
$(document).keydown(function (e) {
    if (e.keyCode == 38) { // if "up" is pressed 
        up();
    } else if (e.keyCode == 40) {
        down();
    } else if (e.keyCode == 8 || e.keyCode == 27) {
        let focused = MenuData.getFocused();
        if (typeof focused != 'undefined') {
            MenuData.cancel(focused.namespace, focused.name);
        }
    } else if (e.keyCode == 13) {
        let focused = MenuData.getFocused();
        if (typeof focused != 'undefined') {
            let menu = MenuData.opened[focused.namespace][focused.name];
            let pos = MenuData.pos[focused.namespace][focused.name];
            let elem = menu.elements[pos];

            if (menu.elements.length > 0) {
                MenuData.submit(focused.namespace, focused.name, elem);
            }
        }
    }

});