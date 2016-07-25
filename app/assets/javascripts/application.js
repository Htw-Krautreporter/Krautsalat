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
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

function showComments(changeStatus, given_id){

	var changeArray = document.getElementsByClassName(changeStatus);
	var commentElements = document.getElementsByClassName("comments");
	var elementIndex = 0;

	for(var i = 0; i < commentElements.length; i++){
		if(commentElements[i].id == given_id){
			elementIndex = i;
		}
	}

	var toChange = changeArray[elementIndex];

	if(toChange.style.display == 'block'){
		toChange.style.display = 'none';
	}
	else{
		toChange.style.display = 'block';
	}
}

function show(elementID){
	var toChange = document.getElementById(elementID);
	if(toChange.style.display == 'block'){
		toChange.style.display = 'none';
	}
	else{
		toChange.style.display = 'block';
	}
}