// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require bootstrap-sprockets
//= require jquery.countdownTimer
//= require moment
//= require parsley
//= require bootstrap-datetimepicker
//= require ckeditor/init
//= require_tree .

  
$(document).ready(function() {
	$('#your-form-name').parsley().on('field:validate', function() {
	  if (!this.isValid()) {
		if (this.value === "") {
		  $('#name-error').text("Please enter name");
		} else if (!/^[A-Za-z ]+$/.test(this.value)) {
		  $('#name-error').text("Not allowed, only Characters are allowed");
		} else {
		  $('#name-error').text(""); // Clear the error message
		}
	  } else {
		$('#name-error').text(""); // Clear the error message
	  }
	});

	// Validate the email field
	$('#your-form-email').parsley().on('field:validate', function() {
	  if (!this.isValid()) {
		if (this.value === "") {
		  $('#email-error').text("Please enter email");
		} else if (!/^[A-Za-z ]+$/.test(this.value)) {
		  $('#email-error').text("Invalid Email Format");
		} 
	  } else {
		$('#email-error').text(""); // Clear the error message
	  }
	});
	// Validate the enroll number field

  });
$(document).ready(function(){
	document.addEventListener('contextmenu', event => event.preventDefault());
	$(".alert").delay(3000).slideUp(1000, function(){
	  $(".alert").alert('close');
	});
});



function preventBack() { window.history.forward(); }
setTimeout("preventBack()", 0);
window.onunload = function () { null };