// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

function disableButton(id) {
	document.getElementById(id).disabled = true;
}

function enableButton(id) {
	document.getElementById(id).disabled = false;
}

function enableButtons() {
	var disabledButtons = getElementsByAttribute('disabled');
	for(var buttonId = 0; buttonId < disabledButtons.length; buttonId ++) {
		disabledButtons(buttonId).disabled = false;
	}
}

function wrapButtons() {
	console.log("wrap");
	var save = document.getElementsByClassName("button-save");
	var cancel = document.getElementsByClassName("button-cancel");
	console.log(save.length);
	for(var i = 0; i < save.length; i++) {
		//console.log(i);
		var parent = save[i].parent;
		var wrapper = document.createElement('div').classList.add('btn-edit');
		parent.appendChild(wrapper);
		wrapper.appendChild(save[i]);
		wrapper.appendChild(cancel[i]);
	}
}

function topicOnClick(id){
	if(id != -1){
		disableButton(id);
	}

	//wrapButtons();
}

function getElementsByAttribute(attr) {
    // get all dom elements
    var elements = document.getElementsByTagName("*");
    // initialize array to put matching elements into
    var foundelements = [];

    // loop through all elements in document
    for (var elementId = 0; elementId < elements.length; elementId++) {
        // check to see if element has any attributes
        if (elements[elementId].attributes.length > 0) {
            // loop through element's attributes  and add it to array if it matches attribute from argument
            for (var attrId = 0; attrId < elements[elementId].attributes.length; attrId++) {
                if (elements[elementId].attributes[attrId].name === attr) {
                    foundelements.push(elements[elementId]);
                }
            }
        }
    }
    return foundelements;
}

/*window.onload = function() {
	var buttons = document.getElementsByClassName('button-cancel');
	console.log('This kinda works: ' + buttons.length);
	for (var buttonId = 0; buttonId < buttons.length; buttonId ++) {
		console.log('Added Listener for: ' + buttonId);
		buttons[buttonId].addEventListener('click', function() { alert('test') }, false);
	}
};
document.addEventListener("DOMSubtreeModified", function(e) {
	var buttons = document.getElementsByClassName('button-cancel');
	console.log('This kinda works: ' + buttons.length);

	for (var buttonId = 0; buttonId < buttons.length; buttonId ++) {
		console.log('Added Listener for: ' + buttonId);
		buttons[buttonId].addEventListener('click', function() { alert('test') }, false);
	}
	
}, false);*/
