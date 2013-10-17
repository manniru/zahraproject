

window.onload= init;
var ss = window.sessionStorage;

function init(){
	/**
	    $("#datepicker").change(function(){
	    	var d1 = $(this).val();
	    	
	    	var today=new Date()
	    	
	    	var mydate= new Date()
	    	var yr=mydate.getFullYear()
	    	var mn=mydate.getMonth()+1
	    	var dy=mydate.getDate()
	   	    	// 09/21/2013 	
	    	var m2 = d1.substring(1,2)
	    	var d2 = d1.substring(3,5)
	    	var y2 = d1.substring(6,10)
	    	

	    	//var d2 = d1.split("/")
	    	//var m2 = d2[0]
	    	//var d2 = d2[1]
	    	//var y2 = d2[2]
	    	//var m3 = m2.substring(1)
	    	//alert(y2+" "+m3+" "+d2)

	    	
	    	var dt1 = new Date(yr,mn,dy)
	    	var dt2 = new Date(y2,m2,d2)
	    	
	    	//var year2000=new Date(2000,0,1)
	    	
	    	var diff=dt2-dt1 //unit is milliseconds
	    	diff=Math.round(diff/1000/60/60/24) //contains days passed since Year 2000

	    	
	    	$('#days').val(diff);
	    });
	    
	    $("#rent").keyup(function(){
	    	var vl = parseInt($(this).val());
	    	var bs = parseInt($('#bsalary').val());
	    	var pns = parseInt($('#pension').val());
	    	var np = bs-(vl+pns);
	    	$('#netpay').val(np);
	    });

	    $("#sduty").keyup(function(){
	    	//var vl = parseInt($(this).val());
	    	var bsalary = parseInt($('#bsalary').val());
	    	var pension = parseInt($('#pension').val());
	    	var rent = parseInt($('#rent').val());
	    	var sduty = parseInt($(this).val()); //parseInt($('#sduty').val());
	    	var tax = parseInt($('#tax').val());
	    	var ins = parseInt($('#ins').val());
	    	var nsh = parseInt($('#nsh').val());
	    	var coop = parseInt($('#coop').val());
	    	var loan = parseInt($('#loan').val());
	    	$('#netpay').val(bsalary-(pension+rent+sduty));
	    });

	    $("#tax").keyup(function(){
	    	var bsalary = parseInt($('#bsalary').val());
	    	var pension = parseInt($('#pension').val());
	    	var rent = parseInt($('#rent').val());
	    	var sduty = parseInt($('#sduty').val());
	    	var tax = parseInt($(this).val()); //parseInt($('#tax').val());
	    	var ins = parseInt($('#ins').val());
	    	var nsh = parseInt($('#nsh').val());
	    	var coop = parseInt($('#coop').val());
	    	var loan = parseInt($('#loan').val());
	    	//var totald = parseInt($('#totald').val());
	    	$('#netpay').val(bsalary-(pension+rent+sduty+tax));
	    });

	    $("#ins").keyup(function(){
	    	var bsalary = parseInt($('#bsalary').val());
	    	var pension = parseInt($('#pension').val());
	    	var rent = parseInt($('#rent').val());
	    	var sduty = parseInt($('#sduty').val());
	    	var tax = parseInt($('#tax').val());
	    	var ins = parseInt($(this).val()); //parseInt($('#ins').val());
	    	var nsh = parseInt($('#nsh').val());
	    	var coop = parseInt($('#coop').val());
	    	var loan = parseInt($('#loan').val());
	    	//var totald = parseInt($('#totald').val());
	    	$('#netpay').val(bsalary-(pension+rent+sduty+tax+ins));
	    });	    

	    $("#nsh").keyup(function(){
	    	var bsalary = parseInt($('#bsalary').val());
	    	var pension = parseInt($('#pension').val());
	    	var rent = parseInt($('#rent').val());
	    	var sduty = parseInt($('#sduty').val());
	    	var tax = parseInt($('#tax').val());
	    	var ins = parseInt($('#ins').val());
	    	var nsh =  parseInt($(this).val()); //parseInt($('#nsh').val());
	    	var coop = parseInt($('#coop').val());
	    	var loan = parseInt($('#loan').val());
	    	$('#netpay').val(bsalary-(pension+rent+sduty+tax+ins+nsh));
	    });	
	  
	    $("#coop").keyup(function(){
	    	var bsalary = parseInt($('#bsalary').val());
	    	var pension = parseInt($('#pension').val());
	    	var rent = parseInt($('#rent').val());
	    	var sduty = parseInt($('#sduty').val());
	    	var tax = parseInt($('#tax').val());
	    	var ins = parseInt($('#ins').val());
	    	var nsh =  parseInt($('#nsh').val());
	    	var coop = parseInt($(this).val()); //parseInt($('#coop').val());
	    	var loan = parseInt($('#loan').val());
	    	$('#netpay').val(bsalary-(pension+rent+sduty+tax+ins+nsh+coop));
	    });	
	    
	    $("#loan").keyup(function(){
	    	var bsalary = parseInt($('#bsalary').val());
	    	var pension = parseInt($('#pension').val());
	    	var rent = parseInt($('#rent').val());
	    	var sduty = parseInt($('#sduty').val());
	    	var tax = parseInt($('#tax').val());
	    	var ins = parseInt($('#ins').val());
	    	var nsh =  parseInt($('#nsh').val());
	    	var coop = parseInt($('#coop').val());
	    	var loan = parseInt($(this).val()); //parseInt($('#loan').val());
	    	$('#netpay').val(bsalary-(pension+rent+sduty+tax+ins+nsh+coop+loan));
	    });			    
	*/
	
	$("#gender").change(function(){
    	var vl = $(this).val(); var vl2="";
    	if(vl=="Male") { vl2="Female"; } if(vl=="Female") { vl2="Male"; }
    	$('#d1').html("Top 10 "+vl2+" Match Percent");
    	//alert(vl);

    	
    	//$('#days').val(diff);
    });
	

}
