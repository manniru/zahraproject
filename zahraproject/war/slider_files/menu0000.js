$(function() {

	var $countrySelect = $("#r_country");
    var $stateSelect = $("#r_state");
	var $citySelect = $("#r_city");

    var statesURL = "/en/widget/loadstates?countryid=";
	var citiesURL = "/en/widget/loadcities?stateid=";

    var $livingWithinRadiusSelect = $("#livingWithinRadius");

	// TODO: eventually put in global.js
	if ($(".vertical").length) {
		
		// banner scroller 
		var offset = $(".vertical").offset();

		var topPadding = 15;
		$(window).scroll(function() {
			if ($(window).scrollTop() > offset.top) {
				$(".vertical").stop().animate({
					marginTop: $(window).scrollTop() - offset.top + topPadding
				});
			} else {
				$(".vertical").stop().animate({
					marginTop: 0
				});
			};
		});
	}
	
	// removes padding when window is resized.
	$(window).resize(function() {
		if ($(window).width() < 1190) {
			$("#bannerwrapper").css("padding-left", "0px");
		}
	});
	
	// remove padding when window width is to small
	function removeBannerPadding() {
		if ($(window).width() < 1190) {
			$("#bannerwrapper").css("padding-left", "0px");
		}
	}
	
	removeBannerPadding();

    $countrySelect.change( function(e){
        // AJAX request using $countrySelect.val() to get states and update $stateSelect >> options
        $stateSelect.find("option").remove();
		$stateSelect.find("optgroup").remove();
        $stateSelect.attr('disabled', true);

        $.ajax({
            url: statesURL+$countrySelect.val(),
            beforeSend: function(){
                $stateSelect.append($('<option>'+loadingText+'</option>') );
            },
            success: function( data ) {
                var options = "";
                var optgroups = [];
                var lastOptGroup = null;
                data = jQuery.parseJSON( data );
                $stateSelect.find("option").remove();
                $stateSelect.append( $('<option value="'+ initialSelectionValue +'">'+anyStateText+'</option>') );
                for( var i = 0; i < data.length; ++i)
                {
                    if( data[i].STATEVALUE != "" && lastOptGroup != null && lastOptGroup != data[i].STATEVALUE)
                    {
                        options += "</optgroup>"
                    }
                    if(data[i].STATEVALUE != "" && optgroups.indexOf( data[i].STATEVALUE ) == -1)
                    {
                        optgroups.push( data[i].STATEVALUE );
                        options+= "<optgroup label='"+ data[i].STATEVALUE +"'>";
                        lastOptGroup = data[i].STATEVALUE;
                    }
                    options += "<option value='"+ data[i].ATTRIBUTEID +"'>"+data[i].TRANSLATION+"</option>";
                }
                $stateSelect.append( $(options) );
                $stateSelect.val("");
                $stateSelect.change();
                if ($stateSelect.parent("span#" + $stateSelect.attr("id") +"_validate").length)
                {
                    eval(($stateSelect).attr("id")).validate();
                }
                $stateSelect.attr('disabled', false);
            }
        });
    });

    $stateSelect.change( function(e){
        // AJAX request using $stateSelect.val() to get states and update $citySelect >> options
        $citySelect.find("option").remove();
        $citySelect.attr('disabled', true);
        $.ajax({
            url: citiesURL+$stateSelect.val(),
            beforeSend: function(){
                $citySelect.append($('<option>'+loadingText+'</option>') );
            },
            success: function( data ) {
                var options = "";
                data = jQuery.parseJSON( data );
                $citySelect.find("option").remove();
                $citySelect.append( $('<option value="'+ initialSelectionValue +'">'+anyCityText+'</option>') );
                for( var i = 0; i < data.length; ++i)
                    options += "<option value='"+ data[i].ATTRIBUTEID +"'>"+data[i].TRANSLATION+"</option>";
                $citySelect.append( $(options) );
                $citySelect.val("");
                $citySelect.change();
                if ($citySelect.parent("span#" + $citySelect.attr("id") + "_validate").length)
                {
                    eval(($citySelect).attr("id")).validate();
                }
                $citySelect.attr('disabled', false);
            }
        });
    });

    if($livingWithinRadiusSelect.length)
    {
        $citySelect.change(function(e){
            if (e.originalEvent &&  $(this).val() != -1)
            {
                $livingWithinRadiusSelect.attr("selectedIndex",3);
                $livingWithinRadiusSelect.attr('disabled',false);
            }
            else
            {
                $livingWithinRadiusSelect.attr("selectedIndex",0);
                $livingWithinRadiusSelect.attr('disabled',true);
            }
        });
    }

	// jScrollPane for recent activity
	$('#activityslider.scroll-pane').jScrollPane({scrollbarMargin:0, showArrows:true});

	// hide/show activity buttons for "Your Recommendations"
	$(".matchbg").hover(
		function(){
			$(".phototext", this).hide();
			$(".matchicons", this).show();
		},
		function(){
			$(".matchicons", this).hide();
			$(".phototext", this).show();
		}
	);
	
	// hide/show activity buttons for "Recent Activity"
	$("#activitybdr li").hover(
		function(){
			$("#toggleactivitytext", this).hide();
			$(".activityicons", this).show();
		},
		function(){
			$(".activityicons", this).hide();
			$("#toggleactivitytext", this).show();
		}
	);
	
	// WHERE DO I START NAV
	// TODO: redev this
	$(".WDISnav").click(function(e){
		var wsisGoTo = Number($(this).attr('name'));
		
		$('.mask2 ul li').hide();
		$('#wdis_'+wsisGoTo).show();
		e.preventDefault();
	});

	// RECOMMENDATION SLIDER: highlight numeric slider navigation
	highlightSliderNavigation = function(page) {
		$('.matchnavbtm ul li').removeClass('active');
		//alert(page);
		$('#'+page).parent().addClass('active');
	}
	// RECOMMENDATION SLIDER: bind slider plugin
	$('.slider').anythingSlider({
		easing: "easeInOutCubic",        // Anything other than "linear" or "swing" requires the easing plugin
		autoPlay: true,                 // This turns off the entire FUNCTIONALY, not just if it starts running or not.
		delay: 15000,                    // How long between slide transitions in AutoPlay mode
		startStopped: false,            // If autoPlay is on, this can force it to start stopped
		animationTime: 2000,             // How long the slide transition takes
		hashTags: true,                 // Should links change the hashtag in the URL?
		buildNavigation: false,          // If true, builds and list of anchor links to link to each slide
		pauseOnHover: true,             // If true, and autoPlay is enabled, the show will pause on hover
		//navigationFormatter: formatText       // Details at the top of the file on this use (advanced use)
		executeFunctionAfterSlide: highlightSliderNavigation
	});
	// RECOMMENDATION SLIDER: next button
	$("#slidernext").click(function(e){
		$('.slider').anythingSlider('next');
		e.preventDefault();
	});
	// RECOMMENDATION SLIDER: previous button
	$("#sliderback").click(function(e){
		$('.slider').anythingSlider('prev');
		e.preventDefault();
	});
	// RECOMMENDATION SLIDER: numeric slider navigation (go to slider number)
	$(".slidernumber").click(function(e){
		var sliderNo = Number($(this).attr('id'));
		$('.slider').anythingSlider(sliderNo);
		
		highlightSliderNavigation(sliderNo);
		
		e.preventDefault();
	});
	
	// add favorite
	$('.favorites-btn').click(function(e) {
		var $favoritesBtn = $(this);
		var memberid = $(this).attr('name');
		
		e.preventDefault();
		MENU.addRemoveFavorite($favoritesBtn,memberid);
	});
	
	// KK - toggle profile status
	$('.profileStatus-btn').click(function(e) {
		var $profileStatusBtn = $(this);
		var dataset = $(this).attr('name');
		
		e.preventDefault();
		MENU.changeProfileStatus($profileStatusBtn,dataset);
	});
	
	// KK - toggle online status
	$('.onlineStatus-btn').click(function(e) {
		var $onlineStatusBtn = $(this);
		var dataset = $(this).attr('name');
		
		e.preventDefault();
		MENU.changeOnlineStatus($onlineStatusBtn,dataset);
	});
	
	// KK - send interest it was coded on purpose that you cannot remove interest simply by clicking on the button again. 
	$('.interest-btn').click(function(e) {
		var memberid = $(this).attr('name');
		var $interestBtn = $(this);
		
		e.preventDefault();
		MENU.addInterest($interestBtn,memberid);
	});
	
	//tooltips
	$('.tipMeActionSentBtn').qtip({
	   content: false,
	   style: { 
		  width: 200,
		  padding: 5,
		  background: '#9d1c37',
		  color: 'white',
		  textAlign: 'center',
		  border: {
			 width: 7,
			 radius: 5,
			 color: '#9d1c37'
		  },
		  //tip: 'leftMiddle',
		  name: 'dark' // Inherit the rest of the attributes from the preset dark style
	   }
	});
	
	//tooltips
	$('.tipMeActionNotSentBtn').qtip({
	   content: false,
	   style: { 
		  width: 200,
		  padding: 5,
		  background: '#CFCFCF',
		  color: 'black',
		  textAlign: 'center',
		  border: {
			 width: 7,
			 radius: 5,
			 color: '#CFCFCF'
		  },
		  //tip: 'leftMiddle',
		  name: 'dark' // Inherit the rest of the attributes from the preset dark style
	   }
	});
	
	$('.activitypic').qtip({
      // Simply use an HTML img tag within the HTML string
	  	style: { 
		  padding: 0
		}
   });

    // Standard member upgrade prompt when they try to hide their profile
    $('#standardMemberUpgrade').click(function(e) {
        e.preventDefault();

        $( "#upgradeBannerModal" ).dialog({
            modal: true,
            height: 'auto',
            width: 'auto'
        });
        return false;
    });
	
});

// namespaced functions
var MENU = {};

// jquery ui display error in dialog window
MENU.showDialogError = function(selector,message) {
	$selector = $(selector);
	
	$($selector).empty().append('<p>'+message+'</p>')
	$($selector).dialog({
		modal: true,
		buttons: {
			Ok: function() {
				$(this).dialog('close');
			}
		}
	});
}

// -------------- ACTION BUTTONS ---------------------
MENU.favoriteCurrentlyRunning = false;
MENU.interestCurrentlyRunning = false;
MENU.profileCurrentlyRunning = false;
MENU.onlineCurrentlyRunning = false;

// add / remove favorite
MENU.addRemoveFavorite = function($favoritesBtn,memberid) {
	
	if (MENU.favoriteCurrentlyRunning == true){
		// stops request queueing while ajax call is being made
		return false;
	}
	
	// add user to fav list
	if ($($favoritesBtn).attr('src') != favoriteimage_selected) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/addFavorite/' + memberid,
			dataType: "json",
			beforeSend: function() {
				MENU.favoriteCurrentlyRunning = true;
				$($favoritesBtn).attr('src', favoriteimage_loading);
				$($favoritesBtn).attr('data-hover', favoriteimage_loading);
			},
			success: function(result){
				if (result.status >= 1) {
					$($favoritesBtn).attr('src', favoriteimage_selected);
					$($favoritesBtn).attr('data-hover', favoriteimage_selected);
					$($favoritesBtn).parent().attr("title","");
				}
				else
				{
					$($favoritesBtn).attr('src',favoriteimage_orig);
					MENU.showDialogError('#error-dialog-message',result.translatedMessage);
				}
				
			},
			error: function(){
					$($favoritesBtn).attr('src',favoriteimage_orig);
					MENU.showDialogError('#error-dialog-message',connectionErrorText);
			},
			complete: function(){
				MENU.favoriteCurrentlyRunning = false;
			}
		});	
	}
}

// add interest
MENU.addInterest = function($interestBtn,memberid) {
	
	if (MENU.interestCurrentlyRunning == true){
		// stops request queueing while ajax call is being made
		return false;
	}
	
	// if interest has been sent then src is reset to a selected image - so we can check against this
	if ($($interestBtn).attr('src') != interestimage_selected) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/showInterest/' + memberid,
			dataType: "json",
			beforeSend: function() {
				MENU.interestCurrentlyRunning = true;
				$($interestBtn).attr('src', interestimage_loading);
				$($interestBtn).attr('data-hover', interestimage_loading);
			},
			success: function(result){
				if (result.status == 1) {
					$($interestBtn).attr('src', interestimage_selected);
					$($interestBtn).attr('data-hover', interestimage_selected);
					$($interestBtn).parent().attr("title","");
				}
				// KK (23/04/10) Added to cater for the case of -confirming mutual interest-
				else if (result.status == 2) {
					$($interestBtn).attr('src', interestimage_selected);
					$($interestBtn).attr('data-hover', interestimage_selected);
					$($interestBtn).parent().attr("title","");
					MENU.showDialogError('#notification-dialog-message',result.translatedMessage);
				}
				else
				{
					$($interestBtn).attr('src',interestimage_orig);
					MENU.showDialogError('#error-dialog-message',result.translatedMessage);
				}
			},
			error: function(){
					$($interestBtn).attr('src', interestimage_orig);
					MENU.showDialogError('#error-dialog-message',connectionErrorText);
			},
			complete: function(){
				MENU.interestCurrentlyRunning = false;
			}
		});
	}
}

// toggle online status
MENU.changeOnlineStatus = function($onlineStatusBtn,dataset){
	if (MENU.onlineCurrentlyRunning == true) {
		// stops request queueing while ajax call is being made
		return false;
	}
	
	// currently available
	if ($($onlineStatusBtn).attr('src') == onlineStatus_available) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/showBusy/' + dataset,
			dataType: "json",
			beforeSend: function(){
				MENU.onlineCurrentlyRunning = true;
				$($onlineStatusBtn).attr('src', green_loading);
			},
			success: function(result){
				if (result.status = 1) {
					$($onlineStatusBtn).attr('src', onlineStatus_busy);
				}
				else {
					$($onlineStatusBtn).attr('src', onlineStatus_available);
					MENU.showDialogError('#error-dialog-message', result.translatedMessage);
				}
				
			},
			error: function(){
				$($onlineStatusBtn).attr('src', onlineStatus_available);
				MENU.showDialogError('#error-dialog-message', connectionErrorText);
			},
			complete: function(){
				MENU.onlineCurrentlyRunning = false;
			}
		});
	}
	// currently busy
	else 
		if ($($onlineStatusBtn).attr('src') != onlineStatus_available) {
			$.ajax({
				url: '/' + siteTranslationPath + '/memberRelationship/showAvailable/' + dataset,
				dataType: "json",
				beforeSend: function(){
					MENU.onlineCurrentlyRunning = true;
					$($onlineStatusBtn).attr('src', red_loading);
				},
				success: function(result){
					if (result.status = 1) {
						$($onlineStatusBtn).attr('src', onlineStatus_available);
					}
					else {
						$($onlineStatusBtn).attr('src', onlineStatus_busy);
						MENU.showDialogError('#error-dialog-message', result.translatedMessage);
					}
				},
				error: function(){
					$($onlineStatusBtn).attr('src', onlineStatus_busy);
					MENU.showDialogError('#error-dialog-message', connectionErrorText);
				},
				complete: function(){
					MENU.onlineCurrentlyRunning = false;
				}
			});
		}
}
	
	// toggle profile status
MENU.changeProfileStatus = function($profileStatusBtn,dataset) {
	if (MENU.profileCurrentlyRunning == true){
		// stops request queueing while ajax call is being made
		return false;
	}
	
	// currently visible
	if ($($profileStatusBtn).attr('src') == profileStatus_visible) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/hideProfile/' + dataset,
			dataType: "json",
			beforeSend: function() {
				MENU.profileCurrentlyRunning = true;
				$($profileStatusBtn).attr('src', green_loading);
			},
			success: function(result){
				if (result.status = 1) {
					$($profileStatusBtn).attr('src', profileStatus_hidden);
				}
				else
				{
					$($profileStatusBtn).attr('src',profileStatus_visible);
					MENU.showDialogError('#error-dialog-message',result.translatedMessage);
				}
				
			},
			error: function(){
					$($profileStatusBtn).attr('src',profileStatus_visible);
					MENU.showDialogError('#error-dialog-message',connectionErrorText);
			},
			complete: function(){
				MENU.profileCurrentlyRunning = false;
			}
		});	
	}
	// currently hidden
	else if ($($profileStatusBtn).attr('src') != profileStatus_visible) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/showProfile/' + dataset,
			dataType: "json",
			beforeSend: function() {
				MENU.profileCurrentlyRunning = true;
				$($profileStatusBtn).attr('src', red_loading);
			},
			success: function(result){
				if (result.status = 1) {
					$($profileStatusBtn).attr('src',profileStatus_visible);
				}
				else
				{
					$($profileStatusBtn).attr('src', profileStatus_hidden);
					MENU.showDialogError('#error-dialog-message',result.translatedMessage);
				}
			},
			error: function(){
					$($profileStatusBtn).attr('src', profileStatus_hidden);
					MENU.showDialogError('#error-dialog-message',connectionErrorText);
			},
			complete: function(){
				MENU.profileCurrentlyRunning = false;
			}
		});	
	}
}