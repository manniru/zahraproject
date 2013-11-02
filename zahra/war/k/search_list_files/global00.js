// bookmark site
function bookmarksite(title,url) {
	if(document.all) {
		// Internet Explorer
		window.external.AddFavorite( url, title );
	}
	else if (window.sidebar) {
		// Mozilla
		window.sidebar.addPanel( title, url, "" );
	}
	else {
		// Chrome,Opera(unsupported)/Unknown
		alert( 'Press <Ctrl-D> to this add page to your bookmarks' );
	}
}
