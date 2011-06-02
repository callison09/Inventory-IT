// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Lives and Binds for general classes
$('.close_software').live("click", function () { // Used for closing software add/edit boxes
	$(this).parent().parent().remove();
});

// Functions
function addtab(url, title) { // Used for anchor tags to add tabs
	$("#blackmamba").tabs("add", url, title);
};

function theme_forms (prefix) { // Called after loading form elements to theme them
	// Make selector for all inputs with a certain prefix
	var inputs_p = '[id|=\"' + prefix + "\"]:input, select";

	// Set style for all inputs
	$(inputs_p).addClass('ui-corner-all ui-state-default');
	$(inputs_p).hover(
		function (){ 
			$(this).toggleClass('ui-state-hover'); 
		});
	$(inputs_p).focus(function(){
		$(this).toggleClass('ui-state-active');
	});
	$(inputs_p).blur(function(){
		$(this).toggleClass('ui-state-active');
	});

}

function popIt () { //Keep the tab panels the same size as the window
	// Get window height, set tab container to windows hieght - header image
	var wh = parseInt($(window).height());
	$(".pop").css("height", wh - 290);
}

function reloadHome (){ //Load the home page content into the accordion
	//Flashes signal icon in corner of tab to show activity
	$('#home_tab_refresh').css('visibility', 'visible');
	$("#home_tab_refresh").effect("pulsate", { times: 7 }, 500);

	//Load the divs via ajax, timeouts have been set
	//Because if they fire too quickly then ruby will crash
	setTimeout("$('#home').load('/root/welcome')", 1500);
	setTimeout("$('#changes').load('/root/changes')", 2500);
	setTimeout("$('#home_tab_refresh').css('visibility', 'hidden')", 3250);
	
}