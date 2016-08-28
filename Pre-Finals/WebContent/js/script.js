// Two methods for timers - setTimeout and SetInterval (single / repeating)

function simpleMessage() {
	alert("This is just an alert box");
}

// settimeout is in milliseconds
//setTimeout(simpleMessage,5000);

var myImage = document.getElementById("mainImage");
var info = document.getElementById("info");

var imageArray = ["image/1.png", "image/2.jpg", "image/3.jpg", "image/4.jpg", "image/5.jpg"];
var infoArray = ["Suraj Shaw <br>Group Leader","Ankit Prasad","Srabani Santra", "MAdhurima Mukherjee", "Surhid Manna"];
var imageIndex = 0;

function changeImage() {
	myImage.setAttribute("src",imageArray[imageIndex]);
	info.innerHTML = infoArray[imageIndex];
	imageIndex++;
	if (imageIndex >= imageArray.length) {
		imageIndex = 0;
	}
}

// setInterval is also in milliseconds
var intervalHandle = setInterval(changeImage,2000);

//myImage.onmouseover =  function() {
	//clearInterval(intervalHandle);
//};
myImage.onclick = function(){
	imageIndex=0;
	changeImage();
};









