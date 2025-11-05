function click_center(){
	var scene = document.getElementsByClassName('widget-scene')[0];
	evt = document.createEvent("MouseEvents");
	evt.initMouseEvent(
		"mousedown",
		true,
		true,
		document.defaultView,
		0,
		Math.floor(scene.offsetWidth / 2),
		Math.floor(scene.offsetHeight / 2),
		Math.floor(scene.offsetWidth / 2),
		Math.floor(scene.offsetHeight / 2),
		false,
		false,
		false,
		false,
		0,
		null
	);
	 

	scene.dispatchEvent(evt);

	evt = document.createEvent("MouseEvents");
	evt.initMouseEvent(
		"mouseup",
		true,
		true,
		document.defaultView,
		0,
		Math.floor(scene.offsetWidth / 2),
		Math.floor(scene.offsetHeight / 2),
		Math.floor(scene.offsetWidth / 2),
		Math.floor(scene.offsetHeight / 2),
		false,
		false,
		false,
		false,
		0,
		null
	);
	 
	scene.dispatchEvent(evt);
}

click_center();

var ele = document.getElementsByClassName('widget-reveal-card widget-reveal-card-open');
if ( ele.length > 0 )
{
	setTimeout(function(){
		click_center();	
	}, 300);	
}

