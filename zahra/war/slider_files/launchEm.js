// short-hand for .ready() function on document object
$(function() {
		   
	
	// EMAIL POPUP: Launching on click
	$('a:.emailpopup').click(function(e){
		e.preventDefault();
		var memberProfileID = Number($(this).attr('rel'));
		var memberName = $(this).attr('memName');
		var siteTranslationPath = $('#email-dialog-popup').attr('lang');
		var formattedTitle = ($('#email-dialog-popup').attr('name')).replace("{1}",memberName);
		
		$('#email-dialog-popup').dialog("option","height",440);
		
		$('div:#email-dialog-popup').html('<iframe width="100%" height="100%" marginWidth="0" padding="10" marginHeight="0" frameBorder="0" scrolling="no" src="" id="iframeEmail" onLoad="LAUNCHEMAIL.toggleEmailWidget()"></iframe><div id="preload-img" style="width:100%; height:100%; background: url(\'/assets/images/generic/loading_icon_large.gif\') no-repeat center center"></div>').dialog({
			open: function(event, ui) {
				window.setTimeout(function() {
					$(document).unbind('mousedown.dialog-overlay').unbind('mouseup.dialog-overlay');
				}, 100);
			},
			title: formattedTitle,
			modal: true,
			autoOpen: true,
			height: 440,
			width: 595,
			position: ["center",10],
			beforeClose: function(event,ui) {
				if (typeof $("#iframeEmail")[0].contentWindow.MAIL != 'undefined')
				{
					$('#iframeEmail')[0].contentWindow.MAIL.storeEmailInSession(memberProfileID,$('#email-dialog-popup>#iframeEmail').contents().find('#emailsubject').val(),$('#email-dialog-popup>#iframeEmail').contents().find('#emailbody').val(),1);
				}
			}
		});
		
		$('#email-dialog-popup>#iframeEmail').hide();
		$('#email-dialog-popup>#preload-img').show();
		$('#email-dialog-popup>#iframeEmail').attr('src', '/' + siteTranslationPath + '/mail/showEmailWidget/' + memberProfileID + '?renderMode=basicview&popupMode=true');
	});
	
	$(document).bind('emailwidget.unloadIFrameSource', function(e){
		$('#email-dialog-popup>#iframeEmail').attr('src', '');
	});
	
	$(document).bind('emailwidget.recalculateHeight', function(e){
		var currentHeight = $('#email-dialog-popup>#iframeEmail').contents().height();
		$("#email-dialog-popup").animate({ height: currentHeight }, 1000, 'linear');
	});
	
	$(document).bind('emailwidget.recalculateHeightAfterDelete', function(e){
		var currentHeight = $('#email-dialog-popup>#iframeEmail').contents().find('.messages').height();
		$("#email-dialog-popup").animate({ height: currentHeight }, 500, 'linear');
	});
	
	$(document).bind('emailwidget.recalculateHeightAfterValidation', function(e, param1){
		var currentHeight = $('#email-dialog-popup>#iframeEmail').contents().find('.messages').height() - param1;
		$("#email-dialog-popup").animate({ height: currentHeight }, 1000, 'linear');
	});
	
});

// namespaced functions
var LAUNCHEMAIL = {};

LAUNCHEMAIL.toggleEmailWidget = function() {
	var currentSource = $('#email-dialog-popup>#iframeEmail').attr('src');
	
	// This code has the purpose to make the iframe available long enough to just calculate the height of its contents
	$('#email-dialog-popup>#iframeEmail').show();
	var currentHeight = $('#email-dialog-popup>#iframeEmail').contents().height();
	$('#email-dialog-popup>#iframeEmail').hide();
	
	// Max out the height we animate to
	// TODO: Need to allow space for potential validation messages
	var animateToHeight = (currentHeight<=770)?currentHeight:770;
	
	if (currentSource.length)
	{
		$("#email-dialog-popup").animate({ height: animateToHeight }, 500, 'linear', function() {	
			$('#email-dialog-popup>#iframeEmail').show();
			$('#email-dialog-popup>#preload-img').hide();
			
			if (animateToHeight == 770)
			{
				$('#email-dialog-popup>#iframeEmail').attr('scrolling','auto');
			}
		});	
	}	
}