let images = ['captains', 'masud', 'sharmin', 'sumon', 'takingpic', 'tarik', 'trio', 'trio2'];
let targetDiv = document.getElementById('homeMainDiv');
setTimeout(() => {
	startImageRotation()
}, 1000);
function startImageRotation() {
	setInterval(() => {
		// Generate a random index to select a random image from the array
		let randomIndex = Math.floor(Math.random() * images.length);
		targetDiv.style.backgroundImage = 'url(' + images[randomIndex] + '.png'; +')';

	}, 2000);
}