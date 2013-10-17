// short-hand for .ready() function on document object
$(function() {

    var $countrySelect = $("#r_country");
    var $stateSelect = $("#r_state");
	var $citySelect = $("#r_city");
    var statesURL = "/en/widget/loadstates?countryid=";
	var citiesURL = "/en/widget/loadcities?stateid=";

    var $tribeSelectMatch = $("#tribeMatch");
    var $tribeSelectProfile = $("#tribeProfile");

	var $casteSelectMatch = $("#casteMatch");
	var $casteSelectProfile = $("#casteProfile");

    var $childrenHaveSelect = $("#childrenHave");
    var $childrenNumberSelect = $("#childrenNumber");
    var $childrenYoungestSelect = $("#childrenYoungest");
    var $childrenOldestSelect = $("#childrenOldest");

    var $religionSelect = $("#religion");
	var $nationalitySelect = $("#nationality");
    var tribeURL = "/en/widget/loadtribes?nationality=";
    var casteURL = "/en/widget/loadcastes?religion=";

    var $incomeSelect = $("#incomeBracket");
    var $currencySelect = $("#resetCurrency");
    var incomeURL = "/en/widget/loadincomebrackets?currencyCode=";

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
                $stateSelect.append( $('<option value="'+ initialSelectionValue +'">'+initialSelectionText+'</option>') );
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
                $citySelect.append( $('<option value="'+ initialSelectionValue +'">'+initialSelectionText+'</option>') );
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

    // Do we have a tribe select?
    if($tribeSelectProfile.length)
    {
        $nationalitySelect.change( function(e){
            // AJAX request using $nationalitySelect.val() to get states and update $tribeSelect >> options
            $tribeSelectProfile.find("option").remove();
            $tribeSelectProfile.find("optgroup").remove();
            $tribeSelectProfile.attr("disabled", true);
            $.ajax({
                url: tribeURL+$nationalitySelect.val(),
                beforeSend: function(){
                    $tribeSelectProfile.append($('<option>'+loadingText+'</option>') );
                },
                success: function( data ) {
                    data = jQuery.parseJSON( data );
                    $tribeSelectProfile.find("option").remove();
                    PROFILEMANAGEMENT.processTribes($tribeSelectProfile, data);

                    if (data.length >= 2)
                    {
                        $tribeSelectProfile.attr("disabled", false);
                        $tribeSelectProfile.parents("li.clearfix").show();
                    }
                    else
                    {
                        $tribeSelectProfile.attr("disabled", true);
                        $tribeSelectProfile.parents("li.clearfix").hide();
                    }
                }
            });
        });
    }

    // Do we have a tribe select?
    if($tribeSelectMatch.length)
    {
        $nationalitySelect.change( function(e){
            // AJAX request using $nationalitySelect.val() to get states and update $tribeSelect >> options
            $tribeSelectMatch.find("option").remove();
            $tribeSelectMatch.find("optgroup").remove();
            $tribeSelectMatch.attr("disabled", true);
            $.ajax({
                url: tribeURL+$nationalitySelect.val(),
                beforeSend: function(){
                    $tribeSelectMatch.append($('<option>'+loadingText+'</option>') );
                },
                success: function( data ) {
                    data = jQuery.parseJSON( data );
                    $tribeSelectMatch.find("option").remove()
                    PROFILEMANAGEMENT.processTribes($tribeSelectMatch, data);
                    $tribeSelectMatch.attr("disabled", false);
                }
            });
        });
    }


    // Do we have a caste select?
    if($casteSelectProfile.length)
    {
        $religionSelect.change( function(e){
            // AJAX request using $religionSelect.val() to get states and update $casteSelect >> options
            $casteSelectProfile.find("option").remove();
            $casteSelectProfile.attr('disabled', true);
            $.ajax({
                url: casteURL+$religionSelect.val(),
                beforeSend: function(){
                    $casteSelectProfile.append($('<option>'+loadingText+'</option>') );
                },
                success: function( data ) {
                    data = jQuery.parseJSON( data );
                    $casteSelectProfile.find("option").remove();
                    PROFILEMANAGEMENT.processCastes($casteSelectProfile,data);

                    if (data.length >= 3)
                    {
                        $casteSelectProfile.attr("disabled", false);
                        $casteSelectProfile.parents("li.clearfix").show();
                        var casteProfileV = new Spry.Widget.ValidationSelect("casteProfileV", {isRequired:true, validateOn:['change'], invalidValue:"null"});
                    }
                    else
                    {
                        $casteSelectProfile.attr("disabled", true);
                        $casteSelectProfile.parents("li.clearfix").hide();
                        var casteProfileV = new Spry.Widget.Utils.destroyWidgets("casteProfileV");
                    }
                }
            });
        });
    }

    if($casteSelectMatch.length)
    {
        $religionSelect.change( function(e){
            // AJAX request using $religionSelect.val() to get states and update $casteSelect >> options
            $casteSelectMatch.find("option").remove();
            $casteSelectMatch.attr('disabled', true);
            $.ajax({
                url: casteURL+$religionSelect.val(),
                beforeSend: function(){
                    $casteSelectMatch.append($('<option>'+loadingText+'</option>') );
                },
                success: function( data ) {
                    data = jQuery.parseJSON( data );
                    $casteSelectMatch.find("option").remove();
                    PROFILEMANAGEMENT.processCastes($casteSelectMatch,data);
                    $casteSelectMatch.attr("disabled", false);
                }
            });
        });
    }

    if($currencySelect.length && $incomeSelect.length)
    {
        $currencySelect.change( function(e){
            $incomeSelect.find("option").remove();
            $incomeSelect.attr('disabled', true);
            $.ajax({
                url: incomeURL+$currencySelect.val(),
                beforeSend: function(){
                    $incomeSelect.append($('<option>'+loadingText+'</option>') );
                },
                success: function( data ) {
                    var options = "";
                    data = jQuery.parseJSON( data );
                    $incomeSelect.find("option").remove();
                    $incomeSelect.append( $('<option value="">'+initialSelectionText+'</option>') );
                    for( var i = 0; i < data.length; ++i)
                        options += "<option value='"+ data[i].ATTRIBUTEID +"'>"+data[i].TRANSLATION+"</option>";
                    $incomeSelect.append( $(options) );
                    $incomeSelect.val("");
                    $("#incomeCurrency").val(data[0].CURRENCYID);
                    $incomeSelect.change();
                    incomeBracket.validate();
                    $incomeSelect.attr('disabled', false);
                }
            });
        });
    }

    if($childrenHaveSelect.length && $childrenNumberSelect.length)
    {
        $childrenHaveSelect.change(function(e){

            if ($childrenHaveSelect.val() == 285)
            {
                $childrenNumberSelect.attr("disabled", true);
                $childrenNumberSelect.parents("li.clearfix").hide();
                childrenNumber.isRequired = false;

                if ($childrenOldestSelect.length && $childrenYoungestSelect.length)
                {
                    $childrenOldestSelect.attr("disabled", true);
                    $childrenOldestSelect.parents("li.clearfix").hide();
                    $childrenYoungestSelect.attr("disabled", true);
                    $childrenYoungestSelect.parents("li.clearfix").hide();
                    childrenOldest.isRequired = false;
                    childrenYoungest.isRequired = false;
                }
            }
            else
            {
                $childrenNumberSelect.attr("disabled", false);
                $childrenNumberSelect.parents("li.clearfix").show();
                childrenNumber.isRequired = true;
                if ($childrenOldestSelect.length && $childrenYoungestSelect.length)
                {
                    $childrenOldestSelect.attr("disabled", false);
                    $childrenOldestSelect.parents("li.clearfix").show();
                    childrenOldest.isRequired = true;

                    if ($childrenNumberSelect.val() == 1)
                    {
                        $childrenYoungestSelect.attr("disabled", true);
                        $childrenYoungestSelect.parents("li.clearfix").hide();
                        childrenYoungest.isRequired = false;
                    }
                    else
                    {
                        $childrenYoungestSelect.attr("disabled", false);
                        $childrenYoungestSelect.parents("li.clearfix").show();
                        childrenYoungest.isRequired = true;
                    }
                }
            }
        });

        if ($childrenYoungestSelect.length)
        {
            $childrenNumberSelect.live('change',function(e){

                if($('#childrenNumber:visible').length)
                {
                    if ($childrenNumberSelect.val() == 1)
                    {
                        $childrenYoungestSelect.attr("disabled", true);
                        $childrenYoungestSelect.parents("li.clearfix").hide();
                        childrenYoungest.isRequired = false;
                    }
                    else
                    {
                        $childrenYoungestSelect.attr("disabled", false);
                        $childrenYoungestSelect.parents("li.clearfix").show();
                        childrenYoungest.isRequired = true;
                    }
                }
            });
        }
    }

    $("#currencyChangerLink").click( function(e) {
        e.preventDefault();

        if ($("#currencyChangerLink").hasClass("showing"))
        {
            $("#resetCurrencyDiv").show();
            $("#currencyChangerLink").removeClass("showing").addClass("hiding");
            $("#currencyChangerLink").text(hideCurrencyChanger);
        }
        else if ($("#currencyChangerLink").hasClass("hiding"))
        {
            $("#resetCurrencyDiv").hide();
            $("#currencyChangerLink").removeClass("hiding").addClass("showing");
            $("#currencyChangerLink").text(changeCurrency);
        }
    });

    $("input[type='checkbox'].additionalCancel").change( function(e) {
        e.preventDefault();

        if (e.target.checked)
        {
            $("input[name='"+ e.target.name +"']:not('.additionalCancel')").each(function(index){
                $(this).attr('checked',false);
            });
        }
        else
        {
            e.target.checked = true;
        }
    });

    $("input[type='checkbox']:not('.additionalCancel')").change( function(e) {
        e.preventDefault();

        if ($("input[name='"+ e.target.name+"'][checked]:not('.additionalCancel')").length)
        {
            $("input[name='"+ e.target.name+"'].additionalCancel").attr('checked',false);
        }
        else
        {
            $("input[name='"+ e.target.name+"'].additionalCancel").attr('checked',true);
        }

    });
	
	$("#profileCompletionExpand").click( function(e) {
		e.preventDefault();
		
		var isProfileCompletionVisible = $("#profileCompletionSteps").is(":visible");
		var $profileCompletionSteps = $("#profileCompletionSteps");
		var $toggleArrow = $("#toggleArrow");
		
		if (isProfileCompletionVisible == false) {
			$profileCompletionSteps.show();
			$toggleArrow.html($toggleArrow.attr('data-down'));
		}
		else {
			$profileCompletionSteps.hide();
			$toggleArrow.html($toggleArrow.attr('data-up'));
		}
	});

    if($(".replaceLink").length) {

        $(".replaceLink").click(function(e) {

            e.preventDefault();

            var field = $(this).attr("data-fieldid");
            var fieldvalue = $(this).attr("data-verifiedvalue");

            if ($(this).attr("data-fieldid") === "r_country" || $(this).attr("data-fieldid") === "r_state" || $(this).attr("data-fieldid") === "r_city")
            {
                var countryfield = $("#countryLiveReplaceLink").attr("data-fieldid");
                var countryvalue = $("#countryLiveReplaceLink").attr("data-verifiedvalue");
                var statefield = $("#stateLiveReplaceLink").attr("data-fieldid");
                var statevalue = $("#stateLiveReplaceLink").attr("data-verifiedvalue");
                var cityfield = $("#cityLiveReplaceLink").attr("data-fieldid");
                var cityvalue = $("#cityLiveReplaceLink").attr("data-verifiedvalue");

                // set value for country
                $("#"+countryfield).val(countryvalue);
                PROFILEMANAGEMENT.processVerifyReplaceLink(countryfield);

                // reload state select and set value, when that's done reload city select and set value
                $stateSelect.find("option").remove();
                $stateSelect.attr('disabled', true);
                $.ajax({
                    url: statesURL+$countrySelect.val(),
                    success: function( data ) {
                        var options = "";
                        var optgroups = [];
                        var lastOptGroup = null;
                        data = jQuery.parseJSON( data );
                        $stateSelect.append( $('<option value="'+ initialSelectionValue +'">'+initialSelectionText+'</option>') );
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
                        $stateSelect.attr('disabled', false);

                        // set value for state select
                        $("#"+statefield).val(statevalue);
                        // rerun validation to get rid of the spry message
                        if ($stateSelect.parent("span#" + $stateSelect.attr("id") +"_validate").length)
                        {
                            eval(($stateSelect).attr("id")).validate();
                        }
                        PROFILEMANAGEMENT.processVerifyReplaceLink(statefield);

                        $citySelect.find("option").remove();
                        $citySelect.attr('disabled', true);
                        $.ajax({
                            url: citiesURL+$stateSelect.val(),
                            success: function( data ) {
                                var options = "";
                                data = jQuery.parseJSON( data );
                                $citySelect.append( $('<option value="'+ initialSelectionValue +'">'+initialSelectionText+'</option>') );
                                for( var i = 0; i < data.length; ++i)
                                    options += "<option value='"+ data[i].ATTRIBUTEID +"'>"+data[i].TRANSLATION+"</option>";
                                $citySelect.append( $(options) );
                                $citySelect.val("");
                                $citySelect.attr('disabled', false);

                                // set value for city
                                $("#"+cityfield).val(cityvalue);
                                PROFILEMANAGEMENT.processVerifyReplaceLink(cityfield);

                                // rerun validation to get rid of the spry message
                                if ($citySelect.parent("span#" + $citySelect.attr("id") + "_validate").length)
                                {
                                    eval(($citySelect).attr("id")).validate();
                                }
                            }
                        });
                    }
                });
            }
            else if ($(this).attr("data-fieldid") === "birthdate")
            {
                var day =  $(this).attr("data-day");
                var month = $(this).attr("data-month");
                var year = $(this).attr("data-year");

                $("#"+field).val(fieldvalue);
                $("#birthdate_day").val(day);
                $("#birthdate_month").val(month);
                $("#birthdate_year").val(year);

                PROFILEMANAGEMENT.processVerifyReplaceLink(field);
            }
            else
            {
                $("#"+field).val(fieldvalue);
                PROFILEMANAGEMENT.processVerifyReplaceLink(field);
            }
        });
    }


	if($("#appearanceSection").length)
    {
        $("#appearanceSection").expandAll({
            expTxt: expandText,
            cllpsTxt: collapseText,
            ref: "li.secondaryAppearanceMatchQuestion",
            switchPosition:'after',
            scroll:true,
            cllpsEl: ".secondaryAppearanceMatchQuestion",
            switchEl: "div",
            switchCls: "showmore"
        });
    }

    if($("#lifestyleSection").length)
    {
        $("#lifestyleSection").expandAll({
            expTxt: expandText,
            cllpsTxt: collapseText,
            ref: "li.secondaryLifestyleMatchQuestion",
            switchPosition:'after',
            scroll:true,
            cllpsEl:".secondaryLifestyleMatchQuestion",
            switchEl: "div",
            switchCls: "showmore"
        });
    }

    if($("#backgroundSection").length)
    {
        $("#backgroundSection").expandAll({
            expTxt: expandText,
            cllpsTxt: collapseText,
            ref: "li.secondaryBackgroundMatchQuestion",
            switchPosition:'after',
            scroll:true,
            cllpsEl:".secondaryBackgroundMatchQuestion",
            switchEl: "div",
            switchCls: "showmore"
        });
    }

    if($("#personalSection").length)
    {
        $("#personalSection").expandAll({
            expTxt: expandText,
            cllpsTxt: collapseText,
            ref: "li.secondaryPersonalMatchQuestion",
            switchPosition:'after',
            scroll:true,
            cllpsEl:".secondaryPersonalMatchQuestion",
            switchEl: "div",
            switchCls: "showmore"
        });
    }

	$('#registration :input').live('change',function(e){
		$(this).parentsUntil( $("li"), ".highlight").removeClass("highlight");
	});

});

// namespaced functions
var PROFILEMANAGEMENT = {};

PROFILEMANAGEMENT.processTribes = function(element, data)
{
    var options = "";
    var optgroups = [];
    var lastOptGroup = null;
    element.append( $('<option value="'+ initialSelectionValue +'">'+initialSelectionText+'</option>') );
    for( var i = 0; i < data.length; ++i)
    {
        if( data[i].COUNTRYTRANSLATION == "" && lastOptGroup != null && lastOptGroup != data[i].COUNTRYTRANSLATION)
        {
            options += "</optgroup>"
        }
        if(data[i].COUNTRYTRANSLATION != "" && optgroups.indexOf( data[i].COUNTRYTRANSLATION ) == -1)
        {
            optgroups.push( data[i].COUNTRYTRANSLATION );
            options+= "<optgroup label='"+ data[i].COUNTRYTRANSLATION +"'>";
            lastOptGroup = data[i].COUNTRYTRANSLATION;
        }
        options += "<option value='"+ data[i].ATTRIBUTEID +"'>"+data[i].TRANSLATION+"</option>";
    }
    element.append( $(options) );
    element.val("");
    element.change();

    if (element.parent("span#" + element.attr("id") + "_validate").length || element.parent("span#" + element.attr("id") + "V").length)
    {
        eval((element).attr("id")).validate();
    }
}

PROFILEMANAGEMENT.processCastes = function(element, data)
{
    var options = "";

    element.append( $('<option value="'+ initialSelectionValue +'">'+initialSelectionText+'</option>') );
    for( var i = 0; i < data.length; ++i)
        options += "<option value='"+ data[i].ATTRIBUTEID +"'>"+data[i].TRANSLATION+"</option>";
    element.append( $(options) );
    element.val("");
    element.change();
}

PROFILEMANAGEMENT.processVerifyReplaceLink = function(element)
{
    $("#"+element+"_qtip").qtip("destroy");

    $("#"+element+"_qtip").removeClass("verificationIconGrey").addClass("verificationIconGreen").attr("src","/assets/images/verification/icon_Verified.png").attr("title",iconVerifiedTitle);

    $("#"+element+"_qtip").qtip({
        content: false,
        style: 'icongreen'
    });
}
