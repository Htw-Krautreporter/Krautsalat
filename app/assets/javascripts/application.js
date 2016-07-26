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


function appendImage(id) {
	var imageUrl = prompt("Fügen Sie hier die URL zu einem Bild ein.", "http://...");
	if(imageUrl == null)
	var imageTag = "";
	else
	var imageTag = "<img src=\"" + validateUrl(imageUrl) + "\" class=\"content-images\" \\>";
	document.getElementById(id).value += imageTag;
}

function appendLink(id) {
	var linkUrl = prompt("Fügen Sie hier eine URL ein.", "http://...");
	var linkText = prompt("Fügen Sie hier einen Linktext ein. (optional)");
	if(linkUrl == null) 
	var link = "";
	else {
		if (linkText == null)
			linkText = linkUrl;
		var link = "<a href=\"" + validateUrl(linkUrl) + "\" class=\"content-link\" target=\"_blank\" \\>" + linkText + "</a>";
	}
	document.getElementById(id).value += link;
}

function appendBoldText(id) {
	var boldText = prompt("Fügen Sie hier Text ein, der fett dargestellt werden soll.");
	if(boldText == null)
	document.getElementById(id).value += "";
	else
	document.getElementById(id).value += "<b>" + boldText + "</b>";
}

function appendItalicText(id) {
	var italicText = prompt("Fügen Sie hier Text ein, der kursiv dargestellt werden soll.");
	if(italicText == null)
	document.getElementById(id).value += "";
	else
	document.getElementById(id).value += "<i>" + italicText + "</i>";
}

function appendColoredText(id) {
	var coloredText = prompt("Fügen Sie hier Text ein, der farbig hervorgehoben werden soll.");
	if(coloredText == null)
	document.getElementById(id).value += "";
	else
	document.getElementById(id).value += "<span class=\"coloredText\">" + coloredText + "</span>";
}

function validateUrl(url) {
	var pattern = /^((http|https|ftp):\/\/)/;

	if(!pattern.test(url)) 
	    return "http://" + url;
	else
		return url
}

