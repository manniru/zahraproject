NOTIFICATION = {};

NOTIFICATION.timeoutId = null;
NOTIFICATION.timeout = 20 * 60 * 1000;
NOTIFICATION.isRTL = false;
NOTIFICATION.titleCounter = 0;
NOTIFICATION.titleCounterRE = /\(\d+\)\s/;

NOTIFICATION.setup = function(provider,key) {

    switch(provider)
    {
        case "pusher":
            var providerObj = new Pusher(key, { encrypted: true });
            break;
        default:
            console.log("missing notification provider");
            break;
    }

    return providerObj;
}

NOTIFICATION.getChannel = function(provider,providerObj,channelId) {

    switch(provider)
    {
        case "pusher":
            var channelObj = providerObj.subscribe(channelId);
            break;
        default:
            console.log("missing notification provider when retrieving channel");
            break;
    }

    return channelObj;
}

NOTIFICATION.executeBindings = function(provider,channelObj) {

    switch(provider)
    {
        case "pusher":
            channelObj.bind('relationship-received', NOTIFICATION.relationshipReceived);
		    channelObj.bind('system-received', NOTIFICATION.systemReceived);
            break;
        default:
            console.log("missing notification provider when setting up bindings");
            break;
    }

}

NOTIFICATION.relationshipReceived = function(data) {

    data = jQuery.parseJSON(data);
    $.gritter.add({
        title: data.heading,
        text: data.text,
        image: data.imagelink,
        sticky: false,
        time: '10000',
        rtl: NOTIFICATION.isRTL
    });
    NOTIFICATION.titleCounter++;
    NOTIFICATION.updateTitleCounter(NOTIFICATION.titleCounter);
    return false;
}

NOTIFICATION.systemReceived = function(data) {
    console.log(data);
}

NOTIFICATION.startInactivityTimer = function(provider,providerObj) {

    NOTIFICATION.timeoutId = window.setTimeout(function() {

        switch(provider)
        {
            case "pusher":
                providerObj.disconnect();
                break;
            default:
                console.log("missing notification provider when setting the inactivity timer");
                break;
        }
    }, NOTIFICATION.timeout);
}

NOTIFICATION.updateTitleCounter = function(newValue) {

    var oldTitle = $("title").text();
    var newTitle = oldTitle.replace(NOTIFICATION.titleCounterRE,"");
    $("title").text("("+newValue+") "+newTitle);

}



