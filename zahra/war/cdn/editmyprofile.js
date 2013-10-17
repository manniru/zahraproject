$.fn.qtip.styles.icongreen = {
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

$.fn.qtip.styles.icongrey = {
    width: 200,
    padding: 5,
    background: '#999999',
    color: 'white',
    textAlign: 'center',
    border: {
     width: 7,
     radius: 5,
     color: '#999999'
    },
    tip: 'topLeft',
    name: 'dark' // Inherit the rest of the attributes from the preset dark style
}

$.fn.qtip.styles.iconbrown = {
    width: 200,
    padding: 5,
    background: '#CC9900',
    color: 'white',
    textAlign: 'center',
    border: {
     width: 7,
     radius: 5,
     color: '#CC9900'
    },
    tip: 'topLeft',
    name: 'dark' // Inherit the rest of the attributes from the preset dark style
}

$(function() {

    $(".verificationIconGreen").qtip({
       content: false,
       style: 'icongreen'
    });

    $(".verificationIconGrey").qtip({
       content: false,
       style: 'icongrey'
    });

});
