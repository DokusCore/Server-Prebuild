const slider = document.getElementById('slider');
const [wrapper, overlay, prevBtn, nextBtn] = slider.children;
const confirmButton =  document.getElementById('confirmButton');
const fill = 'forwards';
var spawns;

function animateAsync(element, keyframes, options) {
    return new Promise(res => {
        const anim = element.animate(keyframes, options);
        setTimeout(res, options.duration || 0);
    })
}

function open(_spawns) {
    spawns = _spawns;
    slider.classList.remove('hide');
    createSlides(_spawns);
}

function close() {
    slider.classList.add('hide');
}


function createSlides(_data, {currentSlideIndex = 0, duration = 300, easing = 'cubic-bezier(0.250, 0.460, 0.450, 0.940)'} = {}) {
    var isFirst = true;
    var spawnLocationAmmount = -1;
    for (const k in _data) {
        if (_data[k]["Enabled"] == true) {
            spawnLocationAmmount = spawnLocationAmmount + 1
            createSlide(k, isFirst, spawnLocationAmmount);
            isFirst = false;
        }
    }

   function slideTo(index, nextOrPrev) {
        if (index === currentSlideIndex) { return; }

        const currentSlide = wrapper.children[currentSlideIndex];
        const nextSlide = wrapper.children[index];

        const pos = nextOrPrev === "next" ? '-100%' : '100%';


        Promise.all([
            animateAsync(nextSlide, [
                {transform: `translate(${parseInt(pos, 10) * -1}%, 0)`},
                {transform: 'translate(0, 0)'}
            ], {duration, fill, easing}),

            animateAsync(currentSlide, [
                {transform: 'translate(0,0)'},
                {transform: `translate(${pos}, 0)`}
            ], {duration, fill, easing})

        ]).then(() => {
            currentSlideIndex = index;
            currentSlide.classList.remove('active');
            nextSlide.classList.add('active');
        })
    }

    nextBtn.addEventListener('click', () => {
        if (currentSlideIndex >= spawnLocationAmmount) { slideTo(0, "next") }
        else { slideTo(currentSlideIndex + 1, "next")};
    });
    prevBtn.addEventListener('click', () => {
        if (currentSlideIndex <= 0) { slideTo(spawnLocationAmmount, "prev") }
        else { slideTo(currentSlideIndex - 1, "prev")};
    })
   
    confirmButton.addEventListener('click', () => {
        div = document.getElementById(currentSlideIndex),
        style = div.currentStyle || window.getComputedStyle(div, false),
        bg = style.backgroundImage.slice(4, -1).replace(/"/g, "");
        bg = bg.replace(".png", '')
        bg = bg.replace("nui://redemrp_respawn/ui/assets/images/spawns/", '')
        $.post('http:/redemrp_respawn/spawn',JSON.stringify(spawns[bg]));
        close();
    })

}

function createSlide(name, active, id) {
    var div = document.createElement("div");
    div.classList.add('slide');
    if (active) { div.classList.add('active') };
    div.style.backgroundImage = `url(assets/images/spawns/${name}.png)`;

    div.setAttribute("id", id);
    wrapper.appendChild(div);
}


$(function(){
	window.onload = (e) => {
		window.addEventListener('message', (event) => {
            console.log(event.data)
			if (event.data.type === 1){
				if (event.data.showMap === true) { open(event.data.spawns) }
				else if (event.data.showMap === false) { close() }
			}
		});
	};
});