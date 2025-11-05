function get_ele(clsName,idx){
	var a = document.getElementsByClassName(clsName);
	if (a.length == 0){
		return null;
	}
	else if(a.length == 1){
		return a[0];
	}
	else {
		if (idx >= 0 && idx < a.length)
			return a[idx];
		else
			return a[0];
	}
}


function listenerInserted(e) {
	
	var x = get_ele("link-like widget-reveal-card-lat-lng", 0);
	if (x != null)
	{
		document.getElementById('reveal-card').removeEventListener('DOMNodeInserted', listenerInserted);
		
		x.addEventListener('DOMCharacterDataModified', function(e){
			var lat_lng, addr1, addr2;
			var a1 = get_ele("link-like widget-reveal-card-lat-lng", 0);
			if (a1 != null){
				lat_lng = a1.innerText;
			}

			var a2 = get_ele("widget-reveal-card-address-line widget-reveal-card-bold", 0);
			if (a2 != null){
				addr1 = a2.innerText;
			}
			
			var a3 = get_ele("widget-reveal-card-address-line", 1);
			if (a3 != null){
				addr2 = a3.innerText;
			}
			
			getRequest.slot_on_address(addr1, addr2, lat_lng);
		}, false);	
	}	
}

document.getElementById('reveal-card').addEventListener('DOMNodeInserted', listenerInserted);


function hide_ele(){
	
	var ct = 0;
	var e = get_ele("gb_sg gb_z", 0);
	if (e!=null){
		if (e.style.display != 'none'){
			e.style.display = 'none';
		}else{
			ct++;
		}
	}
	
	e = get_ele("widget-homescreen-preview-container", 0);
	if (e!=null){
		if (e.style.display != 'none'){
			e.style.display = 'none';
		}else{
			ct++;
		}
	}
	
	e = get_ele("app-horizontal-widget-holder noprint", 0);
	if (e!=null){
		if (e.style.display != 'none'){
			e.style.display = 'none';
		}else{
			ct++;
		}
	}
	
	e = get_ele("widget-minimap", 0);
	if (e!=null){
		if (e.style.display != 'none'){
			e.style.display = 'none';
		}else{
			ct++;
		}
	}	
	
	if (ct >= 4){
		getRequest.slot_on_hided();
	}
}

function _pcReady(){
	
}