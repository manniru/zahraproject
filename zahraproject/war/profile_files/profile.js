// short-hand for .ready() function on document object
$(function() {
	
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
	
	// KK - Start of code to load similar members onScroll 
	if ($("#moremembers").length) {
		var data_loaded = false, top = $('div:#moremembers').offset().top;
	}
	
	PROFILE.check = function(){
		if ($("#moremembers").length) {
			if ( !data_loaded && $(window).scrollTop() + $(window).height() > top ) {
				$('div:#moremembers').css("background", "url('/assets/images/generic/loading_icon.gif') no-repeat center center");
				$('div:#moremembers').load(similarMembers, function() {
					$('div:#moremembers').css("padding", "20px 8px");	
					$('div:#moremembers').css("background-image", "none");
				});
				data_loaded = true;		
			}
		}
	}
	
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

	$(window).scroll(PROFILE.check);
	PROFILE.check();
	// KK - End of code to load similar members onScroll 
	
	// BW (04/04/11) - Displays/removes the text on similar members on mouseover/mouseout 
	$(".member").live('mouseover mouseout', function(event) {
		if (event.type == 'mouseover') {
			$(".text", this).show();
		} else {
			$(".text", this).hide();
		}
	});
	
	//tooltips
	$('.tipMeMatchTrue').qtip({
	   content: false,
	   style: { 
		  width: 200,
		  padding: 5,
		  background: '#83af7b',
		  color: 'white',
		  textAlign: 'center',
		  border: {
			 width: 7,
			 radius: 5,
			 color: '#83af7b'
		  },
		  tip: 'topLeft',
		  name: 'dark' // Inherit the rest of the attributes from the preset dark style
	   }
	});
	
	$('.tipMeMatchFalse').qtip({
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
		  tip: 'topLeft',
		  name: 'dark' // Inherit the rest of the attributes from the preset dark style
	   }
	});
	
	$('.tipMe').qtip({
	   content: false,
	   style: { 
		  width: 200,
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
	
	//hide expanded text initially
	$('.profiletextexpand').hide();
	
	//expand profile text
	$('.profiletextsummary a').click(function(e){
		e.preventDefault();
		PROFILE.expandProfileText();
	});
	//collapse profile text
	$('.profiletextexpand a').click(function(e){
		e.preventDefault();
		PROFILE.collapseProfileText();
	});
		   
	// enlarge thumbnail member photo	
	$('.enlargeThumb').click(function(e){
		var photourl = $(this).attr('href');
		var photono = $(this).attr('name');
		var photopos = $(this).attr('rel');
		e.preventDefault();
		PROFILE.enlargePhoto(photourl,photono);
		PROFILE.editCommentLink(photono,photopos);
		$('#photoComment').show();
	}); 
	
	// enlarge vide thumbnail to video / upgrade banner	   
	$('.video-thumb').click(function(e){
		var mid = $(this).attr('name');
		var access = $(this).attr('id');
		e.preventDefault();
		PROFILE.enlargeVideo(mid,access);
		$('#photoComment').hide();
	}); 
	
	// action button rollover
	$('.rollover').hover(function() {

        var currentImg = $(this).attr('src');
        $(this).attr('src', $(this).attr('data-hover'));
        $(this).attr('data-hover', currentImg);
    }, function() {
        var currentImg = $(this).attr('src');
        $(this).attr('src', $(this).attr('data-hover'));
        $(this).attr('data-hover', currentImg);
    });
	
	// KK - send interest it was coded on purpose that you cannot remove interest simply by clicking on the button again. 
	$('img[id=interest-btn]').click(function(e) {
		var memberid = $(this).attr('name');
		var $interestBtn = $(this);
		
		e.preventDefault();
		PROFILE.addInterest($interestBtn,memberid);
	});
	
	// add favorite
	$('#favorites-btn').click(function(e) {
		var $favoritesBtn = $(this);
		var memberid = $(this).attr('name');
		
		e.preventDefault();
		PROFILE.addRemoveFavorite($favoritesBtn,memberid);
	});

	// add block
	$('#blockuser-btn').click(function(e) {
		var $blockUserBtn = $(this);
		var memberid = $(this).attr('name');
		
		e.preventDefault();
		PROFILE.addRemoveBlock($blockUserBtn,memberid);
	});
	
	// profile tab
	$('#tab-profile').click(function(e) {
		e.preventDefault();
		PROFILE.showProfileTab();
	});
	
	// profile text tab
	$('#tab-essay').click(function(e) {
		e.preventDefault();
		PROFILE.showEssayTab();
	});
	
	//hide/show initial state
	var hideShowCookie = $.cookie('profile.hideShowNoAnswer');
	
	if(hideShowCookie == 'hide'){
		//alert('im hiding');
		PROFILE.hideNoAnswer();
	}
	
	//hide/show no answers
	$('#hideshow').click(function() {
		if($(this).attr('class') == 'hide') {
			PROFILE.hideNoAnswer();
		}
		else {
			PROFILE.showNoAnswer();
		}
	});
	
	//add cupid word
	// BS - put this in namespaced function
	$('.assignCupidWordLink').bind('click', 
		function(event){
			event.preventDefault();
			var cupidWordID = $(this).attr('id');
			$.get(this.href,{},function(response){
				$('#'+'addCupidWordImage'+cupidWordID).attr('src', '/assets/images/generic/btn-crossadded.gif');
			});
		}
	);
	
	// if translated text exists then show on page load
	if ($('.translatedText').length > 0) {
		PROFILE.showTranslatedText();
	}
	// original tab
	$('.original-link').click(function(e) {
		e.preventDefault();
		PROFILE.showOriginalText();
	});
	// translated tab
	$('.translation-link').click(function(e) {
		e.preventDefault();
		PROFILE.showTranslatedText();
	});
	
	$('#deleteNote').click(function(e) {
		e.preventDefault();
		
		var relocateURL = $(this).attr('href');
		
		var buttons = {};
		buttons[noButton] = function() {
			$( this ).dialog( "close" );
		};
		buttons[yesButton] = function() {
			window.location = relocateURL;
		};
		
		$( "#dialog-confirm" ).dialog({
			resizable: false,
			height:180,
			modal: true,
			dialogClass: 'CMuntitledDialog',
			buttons: buttons
		});
		
	});
	
	// Get translation for self and who text translations
	var selftextlen = $('.profiletexttranslation').attr('data-selfTextLen');
	if (selftextlen > 0)
	{
		var mid = $('.profiletexttranslation').attr('data-memberid');
		var enchecksum = $('.profiletexttranslation').attr('data-checksum');
		var fromLang = $('.profiletexttranslation').attr('data-fromLang');
		var toLang = $('.profiletexttranslation').attr('data-toLang');
		var enselfText = $('.profiletexttranslation').attr('data-selfText');
		var enwhoText = $('.profiletexttranslation').attr('data-whoText');
		
		// Call function and pass in the parameters used in the ajax request
		PROFILE.getTranslationText(mid,enchecksum,fromLang,toLang,enselfText,enwhoText);
	}
		
});

// namespaced functions
var PROFILE = {};

// show translated text
PROFILE.showTranslatedText = function() {
	$('.originalText').hide()
	$('.translatedText').show()		
	$('.translation-tab').addClass('selected');		
	$('.original-tab').removeClass('selected');
	$('.scroll-pane').jScrollPane();
	$('.jScrollPaneContainer').css('height','350px').css('width','635px');
	$('.scroll-pane').css('height','auto').css('width','635px');	
}

// show original text
PROFILE.showOriginalText = function() {
	$('.translatedText').hide()
	$('.originalText').show()		
	$('.original-tab').addClass('selected');		
	$('.translation-tab').removeClass('selected');
	$('.scroll-pane').jScrollPane();
	$('.jScrollPaneContainer').css('height','350px').css('width','635px');
	$('.scroll-pane').css('height','auto').css('width','635px');	
}

//expand profile text
PROFILE.expandProfileText = function() {
	$('.profiletextsummary').hide();
	$('.profiletextexpand').show();
	$('.scroll-pane').jScrollPane();//attach scroller - will only appear if text overflows div
	$('.jScrollPaneContainer').css('height','350px').css('width','635px');
	$('.scroll-pane').css('height','auto').css('width','635px');	
}
//collapse profile text
PROFILE.collapseProfileText = function() {
	$('.profiletextexpand').hide();
	$('.profiletextsummary').show();
}

// shows enlarged member photo when thumb clicked
PROFILE.enlargePhoto = function(photourl,photono) {
	var $pic = $('#pic')

	
	if ($("#videoDisplay").length) {
		$("#videoDisplay").html('') // if there was video / message before then clear it.
	}
	
	$($pic).css('background-image', ''); // remove member photo to display load icon (set in css) sitting behind.
	
	if ($("#photoEnlargeAddPhoto").length && photono != 1) {
		
		$("#photoEnlargeAddPhoto").show();
	
	}
	else {
		
		if ($("#photoEnlargeAddPhoto").length) {
			$("#photoEnlargeAddPhoto").hide();
		}
		
		var tmpImg = new Image() ;
		tmpImg.src =  photourl;
		tmpImg.onload = function() {
			$($pic).css('background-image', 'url(' + photourl + ')')
		} ;
		tmpImg.src =  photourl;
	
	}
}

// changed href in comment link
PROFILE.editCommentLink = function(photono,photopos) {
	var $commentHref = $('#photoComment').attr('rel');
	var $commentHref2 = $('#photoComment').attr('rel2');
	var newCommentHref = $commentHref + '&photoNo=' + photono + '&photoPos=' + photopos + $commentHref2;
	
	$('#photoComment').attr('href',newCommentHref);
}

// enlarge vide thumbnail to video / upgrade banner	 
PROFILE.enlargeVideo = function(mid,access) {
	var $pic = $('#pic');
	
	if ($("#photoEnlargeAddPhoto").length) {
		$("#photoEnlargeAddPhoto").hide();
	}
	
	$($pic).css('background-image', '');
	$.post('/' + siteTranslationPath + '/profile/getVideoDisplay',{id:mid,access:access},
			function(data){
				$('#videoDisplay').html(data);
			}
	);
}

// jquery ui display error in dialog window
PROFILE.showDialogError = function(selector,message) {
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
PROFILE.favoriteCurrentlyRunning = false;
PROFILE.blockCurrentlyRunning = false;
PROFILE.interestCurrentlyRunning = false;
//PROFILEMAIL.mailCurrentlyRunning = false;
//PROFILEMAIL.mailHadLoaded = false;
PROFILE.translateTextCurrentlyRunning = false;

// get translation
PROFILE.getTranslationText = function(mid,enchecksum,fromLang,toLang,enselfText,enwhoText) {
	
	// Post data var
	var postData = {
		mid:mid,
		enchecksum:enchecksum,
		fromLang:fromLang,
		toLang:toLang,
		enselfText:enselfText,
		enwhoText:enwhoText
		}
	
	if (PROFILE.translateTextCurrentlyRunning == true){
		// stops request queueing while ajax call is being made
		return false;
	}
	$.ajax({
		type:'POST',
		url: '/' + siteTranslationPath + '/profile/getProfileTranslation/',
		timeout: 10000,
		data: {json: JSON.stringify(postData)},
		dataType: 'json',
		// filter response data
		dataFilter: function(data) {
			if (typeof (JSON) !== 'undefined' && typeof (JSON.parse) === 'function')
				return JSON.parse(data);
			else
				return eval('(' + data + ')');
		},
		beforeSend: function() {
			PROFILE.translationText = true;
			$('.selftranslationtext').css("background", "url('/assets/images/generic/loading_icon.gif') no-repeat center center");
			$('.selftranslationtext').css("height", "60px");
			$('.whotranslationtext').css("background", "url('/assets/images/generic/loading_icon.gif') no-repeat center center");
			$('.whotranslationtext').css("height", "60px");
		},
		success: function(result){
			var profileTextCharLimit = 300;
			var showScrollerCharLimit = 1500;
			var selfDescriptionCharLength = result.self_translation.length;
			var whoDescriptionCharLength = result.who_translation.length;
			
			// Check self translation text length
			if (result.self_translation.length > profileTextCharLimit)
			{
				$('.selftranslationtext').append('<div class="profiletextsummary"><p>' + result.self_translation.substring(0,profileTextCharLimit) + '...<a href="">' + readMoreWithArrow + '</a></p></div>');
				$('.profiletextsummary').show();
				// Check scroller character limit
				if (selfDescriptionCharLength < showScrollerCharLimit)
				{
					$('.selftranslationtext').append('<div class="profiletextexpand"><p>' + result.self_translation + '...<a href="">' + collapseWithArrow + '</a></p></div>');
					$('.profiletextexpand').hide();
				}
				else
				{
					$('.selftranslationtext').append('<div class="profiletextexpand"><div id="scrollme" class="scroll-pane" style="height:350px;"><p>' + result.self_translation + '...<a href="">' + collapseWithArrow + '</a></p></div></div>');
					$('.profiletextexpand').hide();
				}
			}
			else
			{
				$('.selftranslationtext').append('<div class="profiletextsummary"><p>' + result.self_translation + '</p></div>');
				$('.profiletextsummary').show();
				
				if (selfDescriptionCharLength < profileTextCharLimit)
				{
					$('.selftranslationtext').append('<div class="profiletextexpand"><p>' + result.self_translation + '</p></div>');
					$('.profiletextexpand').hide();
				}
				if (selfDescriptionCharLength > profileTextCharLimit && selfDescriptionCharLength < showScrollerCharLimit)
				{
					$('.selftranslationtext').append('<div class="profiletextexpand"><p>' + result.self_translation + '...<a href="">' + collapseWithArrow + '</a></p></div>');
					$('.profiletextexpand').hide();
				}
				if (selfDescriptionCharLength > showScrollerCharLimit)
				{
					$('.selftranslationtext').append('<div class="profiletextexpand"><div id="scrollme" class="scroll-pane" style="height:350px;"><p>' + result.self_translation + '...<a href="">' + collapseWithArrow + '</a></p></div></div>');
					$('.profiletextexpand').hide();
				}
			}
			
			// Check who translation text length
			if (result.who_translation.length > profileTextCharLimit)
			{
				$('.whotranslationtext').append('<div class="profiletextsummary"><p>' + result.who_translation.substring(0,profileTextCharLimit) + '...<a href="">' + readMoreWithArrow + '</a></p></div>');
				$('.profiletextsummary').show();

				// Check scroller character limit
				if (whoDescriptionCharLength < showScrollerCharLimit)
				{
					$('.whotranslationtext').append('<div class="profiletextexpand"><p>' + result.who_translation + '...<a href="">' + collapseWithArrow + '</a></p></div>');
					$('.profiletextexpand').hide();
				}
				else
				{
					$('.whotranslationtext').append('<div class="profiletextexpand"><div id="scrollme" class="scroll-pane" style="height:350px;"><p>' + result.who_translation + '...<a href="">' + collapseWithArrow + '</a></p></div></div>');
					$('.profiletextexpand').hide();
				}
			}
			else
			{
				$('.whotranslationtext').append('<div class="profiletextsummary"><p>' + result.who_translation + '</p></div>');
				$('.profiletextsummary').show();
				
				if (whoDescriptionCharLength < profileTextCharLimit)
				{
					$('.whotranslationtext').append('<div class="profiletextexpand"><p>' + result.who_translation + '</p></div>');
					$('.profiletextexpand').hide();
				}
				if (whoDescriptionCharLength > profileTextCharLimit && whoDescriptionCharLength < showScrollerCharLimit)
				{
					$('.whotranslationtext').append('<div class="profiletextexpand"><p>' + result.who_translation + '...<a href="">' + collapseWithArrow + '</a></p></div>');
					$('.profiletextexpand').hide();
				}
				if (whoDescriptionCharLength > showScrollerCharLimit)
				{
					$('.whotranslationtext').append('<div class="profiletextexpand"><div id="scrollme" class="scroll-pane" style="height:350px;"><p>' + result.who_translation + '...<a href="">' + collapseWithArrow + '</a></p></div></div>');
					$('.profiletextexpand').hide();
				}
			}
		},
		error: function(){
			$('.originalText').show()
			$('.translatedText').hide()		
			$('.translation-tab').removeClass('tab-selected').hide();		
			$('.original-tab').removeClass('tab-selected').hide();	
		},
		complete: function(){
			$('.selftranslationtext').css("background", "none");
			$('.selftranslationtext').css("height", "auto");
			$('.whotranslationtext').css("background", "none");
			$('.whotranslationtext').css("height", "auto");
			PROFILE.translateTextCurrentlyRunning = false;
		}
	});
}

// add / remove favorite
PROFILE.addRemoveFavorite = function($favoritesBtn,memberid) {
	
	if (PROFILE.favoriteCurrentlyRunning == true){
		// stops request queueing while ajax call is being made
		return false;
	}
	
	// add user to fav list
	if ($($favoritesBtn).attr('src') != favoriteimage_selected) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/addFavorite/' + memberid,
			dataType: "json",
			beforeSend: function() {
				PROFILE.favoriteCurrentlyRunning = true;
				$($favoritesBtn).attr('src', favoriteimage_loading);
				$($favoritesBtn).attr('data-hover', favoriteimage_loading);
			},
			success: function(result){
				if (result.status >= 1) {
					$($favoritesBtn).attr('src', favoriteimage_selected);
					$($favoritesBtn).attr('data-hover', favoriteimage_selected);
				}
				else
				{
					$($favoritesBtn).attr('src',favoriteimage_orig);
					$($favoritesBtn).attr('data-hover',favoriteimage_hover);
					PROFILE.showDialogError('#error-dialog-message',result.translatedMessage);
				}
				
			},
			error: function(){
					$($favoritesBtn).attr('src',favoriteimage_orig);
					$($favoritesBtn).attr('data-hover',favoriteimage_hover);
					PROFILE.showDialogError('#error-dialog-message',connectionErrorText);
			},
			complete: function(){
				PROFILE.favoriteCurrentlyRunning = false;
			}
		});	
	}
	// remove user from fav list
	else if ($($favoritesBtn).attr('src') == favoriteimage_selected) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/deleteFavorite/' + memberid,
			dataType: "json",
			beforeSend: function() {
				PROFILE.favoriteCurrentlyRunning = true;
				$($favoritesBtn).attr('src', favoriteimage_loading);
				$($favoritesBtn).attr('data-hover', favoriteimage_loading);
			},
			success: function(result){
				if (result.status = 1) {
					$($favoritesBtn).attr('src',favoriteimage_orig);
					$($favoritesBtn).attr('data-hover',favoriteimage_hover);
				}
				else
				{
					$($favoritesBtn).attr('src', favoriteimage_selected);
					$($favoritesBtn).attr('data-hover', favoriteimage_selected);
					PROFILE.showDialogError('#error-dialog-message',result.translatedMessage);
				}
			},
			error: function(){
					$($favoritesBtn).attr('src', favoriteimage_selected);
					$($favoritesBtn).attr('data-hover', favoriteimage_selected);
					PROFILE.showDialogError('#error-dialog-message',connectionErrorText);
			},
			complete: function(){
				PROFILE.favoriteCurrentlyRunning = false;
			}
		});	
	}
}

// add / remove block
PROFILE.addRemoveBlock = function($blockUserBtn,memberid) {
	
	if (PROFILE.blockCurrentlyRunning == true){
		// stops request queueing while ajax call is being made
		return false;
	}
	
	// add user to block list
	if ($($blockUserBtn).attr('src') != blockuserimage_selected) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/addBlock/' + memberid,
			dataType: "json",
			beforeSend: function() {
				PROFILE.blockCurrentlyRunning = true;
				$($blockUserBtn).attr('src', blockuserimage_loading);
				$($blockUserBtn).attr('data-hover', blockuserimage_loading);
			},
			success: function(result){
				if (result.status >= 1) {
					$($blockUserBtn).attr('src', blockuserimage_selected);
					$($blockUserBtn).attr('data-hover', blockuserimage_selected);
				}
				else
				{	
					$($blockUserBtn).attr('src',blockuserimage_orig);
					$($blockUserBtn).attr('data-hover',blockuserimage_hover);
					PROFILE.showDialogError('#error-dialog-message',result.translatedMessage);
				}
			},
			error: function(){
					$($blockUserBtn).attr('src',blockuserimage_orig);
					$($blockUserBtn).attr('data-hover',blockuserimage_hover);
					PROFILE.showDialogError('#error-dialog-message',connectionErrorText);
			},
			complete: function(){
				PROFILE.blockCurrentlyRunning = false;
			}
		});	
	}
	// remove user from block list
	else if ($($blockUserBtn).attr('src') == blockuserimage_selected) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/removeBlock/' + memberid,
			dataType: "json",
			beforeSend: function() {
				PROFILE.blockCurrentlyRunning = true;
				$($blockUserBtn).attr('src', blockuserimage_loading);
				$($blockUserBtn).attr('data-hover', blockuserimage_loading);
			},
			success: function(result){
				if (result.status = 1) {
					$($blockUserBtn).attr('src',blockuserimage_orig);
					$($blockUserBtn).attr('data-hover',blockuserimage_hover);
				}
				else
				{
					$($blockUserBtn).attr('src', blockuserimage_selected);
					$($blockUserBtn).attr('data-hover', blockuserimage_selected);
					PROFILE.showDialogError('#error-dialog-message',result.translatedMessage);
				}
			},
			error: function(){
					$($blockUserBtn).attr('src', blockuserimage_selected);
					$($blockUserBtn).attr('data-hover', blockuserimage_selected);
					PROFILE.showDialogError('#error-dialog-message',connectionErrorText);
			},
			complete: function(){
				PROFILE.blockCurrentlyRunning = false;
			}
		});	
	}

}

// add interest
PROFILE.addInterest = function($interestBtn,memberid) {
	
	if (PROFILE.interestCurrentlyRunning == true){
		// stops request queueing while ajax call is being made
		return false;
	}
	
	// if interest has been sent then src is reset to a selected image - so we can check against this
	if ($($interestBtn).attr('src') != interestimage_selected) {
		$.ajax({
			url: '/' + siteTranslationPath + '/memberRelationship/showInterest/' + memberid,
			dataType: "json",
			beforeSend: function() {
				PROFILE.interestCurrentlyRunning = true;
				$($interestBtn).attr('src', interestimage_loading);
				$($interestBtn).attr('data-hover', interestimage_loading);
			},
			success: function(result){
				if (result.status == 1) {
					$($interestBtn).attr('src', interestimage_selected);
					$($interestBtn).attr('data-hover', interestimage_selected);
				}
				// KK (23/04/10) Added to cater for the case of -confirming mutual interest-
				else if (result.status == 2) {
					$($interestBtn).attr('src', interestimage_selected);
					$($interestBtn).attr('data-hover', interestimage_selected);
					PROFILE.showDialogError('#notification-dialog-message',result.translatedMessage);
				}
				else
				{
					$($interestBtn).attr('src',interestimage_orig);
					$($interestBtn).attr('data-hover',interestimage_hover);
					PROFILE.showDialogError('#error-dialog-message',result.translatedMessage);
				}
			},
			error: function(){
					$($interestBtn).attr('src', interestimage_orig);
					$($interestBtn).attr('data-hover', interestimage_hover);
					PROFILE.showDialogError('#error-dialog-message',connectionErrorText);
			},
			complete: function(){
				PROFILE.interestCurrentlyRunning = false;
			}
		});
	}
}

//TABS
//profile tab
PROFILE.showProfileTab = function() {
	$('#profile-essay').hide()
	$('#profile-main').show()	
	$('#tab-profile').addClass('selected');		
	$('#tab-essay').removeClass('selected');
}
// profile text tab
PROFILE.showEssayTab = function() {
	$('#profile-main').hide()
	$('#profile-essay').show()		
	$('#tab-essay').addClass('selected');		
	$('#tab-profile').removeClass('selected');
}

// show no answers
PROFILE.showNoAnswer = function() {
	var $hideShow = $('#hideshow');
	
	$('.collapsable').show();
	$($hideShow).removeClass('show');		
	$($hideShow).addClass('hide');
	$($hideShow).text('[ ' + showNoAnswerText + ' ]');
	// set cookie to remember this setting
	$.cookie('profile.hideShowNoAnswer', 'show', { expires: 30 });
}

// hide no answers
PROFILE.hideNoAnswer = function() {
	var $hideShow = $('#hideshow');
	
	$('.collapsable').hide();
	$($hideShow).removeClass('hide');		
	$($hideShow).addClass('show');
	$($hideShow).text('[ ' + hideNoAnswerText + ' ]');
	// set cookie to remember this setting
	$.cookie('profile.hideShowNoAnswer', 'hide', { expires: 30 });
}