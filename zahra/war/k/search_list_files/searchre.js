// short-hand for .ready() function on document object
$(function() {
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
	
	$('#deleteFromResultsButton').attr('disabled', 'disabled');
	
	$(':checkbox[name="memberID"]').click(function() {
		var buttonsChecked = $(':checkbox[name="memberID"]:checked');
		
		if (buttonsChecked.length) {
			$('#deleteFromResultsButton').removeAttr('disabled');
        }
        else {
            $('#deleteFromResultsButton').attr('disabled', 'disabled');
        }
	});
	
	$('#deleteFromResultsButton').click(function(e){
		var $deleteBtn = $(this);
		var pageNo = $('#currentPageMarker').attr('name');
		
		var aMemberID = $(':checkbox[name="memberID"]:checked').serialize();
		
		var buttons = {};
		buttons[cancelButton] = function() {
			var buttonsChecked = $(':checkbox[name="memberID"]:checked');
			
			if (buttonsChecked.length) {
				$('#deleteFromResultsButton').removeAttr('disabled');
	        }
	        else {
	            $('#deleteFromResultsButton').attr('disabled', 'disabled');
	        }
			
			$(this).dialog("close");
		};
		buttons[deleteFromResultsButton] = function() {
			RESULTS.deleteFromResults($deleteBtn,pageNo,aMemberID);
		};
		
		e.preventDefault();
		
		$deleteBtn.attr('disabled', 'disabled');
		
		$("#dialog-confirm").dialog({
			resizable: false,
			height:180,
			width:300,
			modal: true,
			buttons: buttons,
			dialogClass: 'CMuntitledDialog'
		});	
		
	});

	// check/uncheck all
	$('#checkall').click(function(e) {
		if ($(this).attr('data-state') == 'select')
		{
			$(':checkbox[name="memberID"]').attr("checked","checked");
			$(this).attr('data-state','unselect');
			$(this).val(unselectAllButton);
			$('#deleteFromResultsButton').removeAttr('disabled');
		}
		else if ($(this).attr('data-state') == 'unselect')
		{
			$(':checkbox[name="memberID"]').attr("checked","");
			$(this).attr('data-state','select');
			$(this).val(selectAllButton);
			$('#deleteFromResultsButton').attr('disabled', 'disabled');
		}	
	});
	
	// add favorite
	$('.addfavorites').click(function(e) {
		var $favoritesBtn = $(this);
		var memberid = $(this).attr('name');
		
		e.preventDefault();
		RESULTS.addRemoveFavorite($favoritesBtn,memberid);
	});
	
	// add interest
	$('.sendinterest').click(function(e) {
		var $interestBtn = $(this);
		var memberid = $(this).attr('name');
		
		e.preventDefault();
		RESULTS.addInterest($interestBtn,memberid);
	});
	
	//tooltip
	$('.tipMe').qtip({
		content: false,
		show: {
			delay: 300
		},
		style: {
			//width: 200,
		padding: 5,
		background: '#7f7d7e',
		color: 'white',
		textAlign: 'left',
		border: {
			width: 7,
			radius: 5,
			color: '#7f7d7e'
		},
		tip: 'topLeft',
		name: 'dark' // Inherit the rest of the attributes from the preset dark style
		}
	});
	
	$('.tipMeRLT').qtip({
		content: "blabla",
		position: {
		  corner: {
			 target: 'bottomMiddle',
			 tooltip: 'topRight'
		  }
	   },
		show: {
			delay: 300
		},
		style: {
			//width: 200,
		padding: 5,
		background: '#7f7d7e',
		color: 'white',
		textAlign: 'right',
		border: {
			width: 7,
			radius: 5,
			color: '#7f7d7e'
		},
		tip: 'topRight',
		name: 'dark' // Inherit the rest of the attributes from the preset dark style
		}
	});
	
	$('.tipMeRed').qtip({
	   content: false,
	   show: {
			delay: 300
		},
	   style: { 
		  //width: 200,
		  padding: 5,
		  background: '#9d1c37',
		  color: 'white',
		  textAlign: 'left',
		  border: {
			 width: 7,
			 radius: 5,
			 color: '#9d1c37'
		  },
		  tip: 'topLeft',
		  name: 'dark' // Inherit the rest of the attributes from the preset dark style
	   }
	});
	
	$('.tipMeRedRTL').qtip({
	   content: false,
		position: {
		  corner: {
			 target: 'bottomMiddle',
			 tooltip: 'topRight'
		  }
	   },
	   show: {
			delay: 300
		},
	   style: { 
		  //width: 200,
		  padding: 5,
		  background: '#9d1c37',
		  color: 'white',
		  textAlign: 'right',
		  border: {
			 width: 7,
			 radius: 5,
			 color: '#9d1c37'
		  },
		  tip: 'topRight',
		  name: 'dark' // Inherit the rest of the attributes from the preset dark style
	   }
	});
	
	/*$(document).bind('results.recalculateHeight', function(e){
		var currentHeight = $('#regomodal>#iframeRego').contents().height();
		$("#regomodal").animate({ height: currentHeight }, 1000, 'linear');
	});*/
	
	$('#pageHelpToolTip').click(function(){
		$('#pageHelpModal').html($('#pageHelpModal').html()).dialog({
			title: $('#pageHelpModal').attr('data-title'),
			modal: true,
			dialogClass: 'pageHelpModal',
			autoOpen: true,
			width: 760
		});
	});

    /* SEO Pages */

    // Put cursor in the first name field
    $('#firstname').focus();

    // Validate form fields
    $('#form').submit( function() {

        var messageObj = {};
        var error = false;
        var password_empty = false;
        var email_empty = false;

        // TODO: Support foreign languages
        var firstname = 'Please enter your first name.';
        var gender = 'Please select your gender.';
        var password = 'Please enter your password.';
        var password_length = 'Your Password is less than 6 characters. Please choose another password that is between 6-20 characters.';
        var email = 'Please enter a valid email address.';
        var invalid_email = 'Please enter a valid email address.';

        if($('#firstname').val().length == 0){
            messageObj['firstname'] = firstname;
            error = true;
        }

        if($('#radio').attr('checked') == false && $('#radio2').attr('checked') == false){
            messageObj['gender'] = gender;
            error = true;
        }

        if($('#password').val().length == 0){
            messageObj['password'] = password;
            error = true;
            password_empty = true;
        }

        if(!password_empty && $('#password').val().length < 6 || $('#password').val().length > 20){
            messageObj['password_length'] = password_length;
            error = true;
        }

        if($('#email').val().length == 0){
            messageObj['email'] = email;
            error = true;
            email_empty = true;
        }

        if(!email_empty && $('#email').val().length > 0){
            var emailRegex = new RegExp(/^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$/i);
            var valid = emailRegex.test($('#email').val());
            if (!valid) {
                messageObj['invalid_email'] = invalid_email;
                error = true;
            }
        }

        // Error detected
        if(error) {
            var output = '';
            for (var key in messageObj) {
                output += messageObj[key] + '\n';
            }
            // Output error the messages
            alert(output);

            // Stops the submit
            return false;
        }

    })

    // Append expand/collapse arrows the content ends
    $('<span class="read-more more">' + $('.displayContent').attr('data-expandArrow') + '</span>').appendTo('.displayContent p');
    $('.content p').last().append('<span class="read-more">' + $('.content').attr('data-collapseArrow') + '</span>');

    $('.content').slideUp(1000);

    // SEO Pages expand/collapse content
    $('.read-more').click(function(){
        if ($(this).hasClass('more'))
        {
            $('.content').slideDown(1000);
            $('.more').hide();
        }
        else
        {
            $('.content').slideUp(1000);
            $('.more').show();
        }
    });

});

//This function returns the dialog's button
function getDialogButton( dialog_selector, button_name )
{
  var buttons = $( dialog_selector + ' .ui-dialog-buttonpane button' );
  for ( var i = 0; i < buttons.length; ++i )
  {
     var jButton = $( buttons[i] );
     if ( jButton.text() == button_name )
     {
         return jButton;
     }
  }

  return null;
}

// namespaced functions
var RESULTS = {};

RESULTS.deleteFromResultsCurrentlyRunning = false;
RESULTS.favoriteCurrentlyRunning = false;
RESULTS.interestCurrentlyRunning = false;

//add / remove favorite
RESULTS.addRemoveFavorite = function($favoritesBtn,memberid) {
	
	if (RESULTS.favoriteCurrentlyRunning == true){
		// stops request queueing while ajax call is being made
		return false;
	}
	
	// add user to fav list
	if ($($favoritesBtn).hasClass('iconfavorites')) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/addFavorite/' + memberid,
			dataType: "json",
			beforeSend: function() {
				RESULTS.favoriteCurrentlyRunning = true;
				$($favoritesBtn).removeClass('iconfavorites').addClass('iconload');
			},
			success: function(result){
				if (result.status >= 1) {
					$($favoritesBtn).removeClass('iconload iconfavorites').addClass('iconfavoritessent');
					$($favoritesBtn).children('a').attr("title","");
					RESULTS.showFavoriteNotification($($favoritesBtn).attr('data-name'),$($favoritesBtn).attr('data-imageurl'));
				}
				else
				{
					$($favoritesBtn).removeClass('iconload iconfavorites').addClass('iconfavorites');
					RESULTS.showDialogError('#error-dialog-message',result.translatedMessage);
				}
				
			},
			error: function(){
					$($favoritesBtn).removeClass('iconload iconfavorites').addClass('iconfavorites');
					RESULTS.showDialogError('#error-dialog-message',connectionErrorText);
			},
			complete: function(){
				RESULTS.favoriteCurrentlyRunning = false;
			}
		});	
	}
}

// add interest
RESULTS.addInterest = function($interestBtn,memberid) {
	
	if (RESULTS.interestCurrentlyRunning == true){
		// stops request queueing while ajax call is being made
		return false;
	}
	
	if ($($interestBtn).hasClass('iconinterest')) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/showInterest/' + memberid,
			dataType: "json",
			beforeSend: function() {
				RESULTS.interestCurrentlyRunning = true;
				$($interestBtn).removeClass('iconinterest').addClass('iconload');
			},
			success: function(result){
				if (result.status == 1) {
					$($interestBtn).removeClass('iconinterest iconload').addClass('iconinterestsent');
					$($interestBtn).children('a').attr("title","");
					RESULTS.showInterestNotification($($interestBtn).attr('data-name'),$($interestBtn).attr('data-imageurl'));
				}
				else if (result.status == 2) {
					$($interestBtn).removeClass('iconinterest iconload').addClass('iconinterestsent');
					$($interestBtn).children('a').attr("title","");
					RESULTS.showDialogError('#notification-dialog-message',result.translatedMessage);
				}
				else
				{
					$($interestBtn).removeClass('iconinterest iconload').addClass('iconinterest');
					RESULTS.showDialogError('#error-dialog-message',result.translatedMessage);
				}
			},
			error: function(){
				$($interestBtn).removeClass('iconinterest iconload').addClass('iconinterest');
					RESULTS.showDialogError('#error-dialog-message',connectionErrorText);
			},
			complete: function(){
				RESULTS.interestCurrentlyRunning = false;
			}
		});
	}
}

//jquery ui display error in dialog window
RESULTS.showDialogError = function(selector,message) {
	$selector = $(selector);
	
	var buttons = {};
	buttons[okButton] = function() {
		$(this).dialog('close');
	};
	
	$($selector).empty().append('<p>'+message+'</p>')
	$($selector).dialog({
		modal: true,
		buttons: buttons,
		dialogClass: 'CMtitledDialog'
	});
}

RESULTS.showInterestNotification = function(name,imageurl) {
	$.gritter.add({
		// (string | mandatory) the heading of the notification
		title: notificationInterestTitle,
		// (string | mandatory) the text inside the notification
		text: notificationInterestText.replace("{1}",name),
		// (string | optional) the image to display on the left
		image: imageurl,
		// (bool | optional) if you want it to fade out on its own or just sit there
		sticky: false,
		// (int | optional) the time you want it to be alive for before fading out
		time: ''
	});
	return false;
}

RESULTS.showFavoriteNotification = function(name,imageurl) {
	$.gritter.add({
		// (string | mandatory) the heading of the notification
		title: notificationFavoriteTitle,
		// (string | mandatory) the text inside the notification
		text: notificationFavoriteText.replace("{1}",name),
		// (string | optional) the image to display on the left
		image: imageurl,
		// (bool | optional) if you want it to fade out on its own or just sit there
		sticky: false,
		// (int | optional) the time you want it to be alive for before fading out
		time: ''
	});
	return false;
}

RESULTS.deleteFromResults = function($$deleteBtn,pageNo,aMemberID) {
	
	if (RESULTS.deleteFromResultsCurrentlyRunning == true){
		// stops request queueing while ajax call is being made
		return false;
	}
	
	$.ajax({
		url: '/' + siteTranslationPath + '/' + deleteFromResultsLink + '?ajaxMode=true&'+ aMemberID,
		dataType: "json",
		type: "POST",
		data: {pageNo:pageNo},
		beforeSend: function() {
			RESULTS.deleteFromResultsCurrentlyRunning = true;
			$("#dialog-confirm-textcontent").hide();
			$("#dialog-confirm-busy").show();
			var button = getDialogButton('.CMuntitledDialog', deleteFromResultsButton);
			if (button)
			{
				button.addClass('ui-state-disabled').attr('disabled', true);
			}
			button = getDialogButton('.CMuntitledDialog', cancelButton);
			if (button)
			{
				button.addClass('ui-state-disabled').attr('disabled', true);
			}
		},
		success: function(result){
			if (result.status == 1)
			{
				top.location = result.dataset;	
			}
			else if (result.status == -100)
			{
				top.location = result.redirectLink;	
			}
			else if (result.status == -1)
			{
				RESULTS.showDialogError('#error-dialog-message',connectionErrorText);
			}		
		},
		error: function(){
			RESULTS.showDialogError('#error-dialog-message',connectionErrorText);
		},
		complete: function(){
			var button = getDialogButton('.CMuntitledDialog', deleteFromResultsButton);
			if (button)
			{
				button.removeAttr('disabled').removeClass('ui-state-disabled');
			}
			button = getDialogButton('.CMuntitledDialog', cancelButton);
			if (button)
			{
				button.removeAttr('disabled').removeClass('ui-state-disabled');
			}
			$("#dialog-confirm-busy").hide();
			$("#dialog-confirm-textcontent").show();
			RESULTS.deleteFromResultsCurrentlyRunning = false;
			$('#dialog-confirm').dialog("close");
		}
	});
}