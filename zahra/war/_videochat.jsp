<html lang="en">
    <head>
        <title>Zahra Matchmaking Vide Chat System</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <link rel="author" type="text/html" href="https://plus.google.com/100325991024054712503">
        <meta name="author" content="Muaz Khan">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="stylesheet" href="https://www.webrtc-experiment.com/style.css">
        <style>
            audio,video {
				width: 100%;
				vertical-align:top;
			}
			input {
				font-size: 2em;
				width: 4em;
			}
			
			p { padding: 1em; }
        </style>
        <script>
            document.createElement('article');
            document.createElement('footer');
        </script>
		
        <!-- Meeting.js library -->
        <script src="https://www.webrtc-experiment.com/meeting/meeting.js"> </script>
    </head>

    <body>
    
<article>
  <div style="font:Tahoma, Geneva, sans-serif; color:#FFF"><h1><strong>Welcome to Zahramaigari Match Making System Online Video Chat</strong></h1></div>


            <section class="plusone-gplus">
                <div class="g-plusone" data-href="https://www.webrtc-experiment.com/"></div>
            </section>
		
            <!-- just copy this <section> and next script -->
            <section class="experiment">
                <section>
                    <h2 style="border: 0; padding-left: .5em;">Type the name:</h2>
					<input type="text" id="meeting-name">
                  <button id="setup-meeting">Create Video Chat</button>
        </section>

                <table style="width: 100%;" id="meetings-list"></table>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <h2 style="display: block; font-size: 1em; text-align: center;">You!</h2>
							<div id="local-streams-container"></div>
                        </td>
                        <td style="background: white;">
                            <h2 style="display: block; font-size: 1em; text-align: center;">Remote Peers</h2>
							<div id="remote-streams-container"></div>
                        </td>
                    </tr>
                </table>
            </section>
		
            <script>
                var meeting = new Meeting();

                var meetingsList = document.getElementById('meetings-list');
                var meetingRooms = {};
                meeting.onmeeting = function (room) {
                    if (meetingRooms[room.roomid]) return;
                    meetingRooms[room.roomid] = room;

                    var tr = document.createElement('tr');
                    tr.innerHTML = '<td>' + room.roomid + '</td>' +
                        '<td><button class="join">Join</button></td>';

                    meetingsList.insertBefore(tr, meetingsList.firstChild);

                    // when someone clicks table-row; joining the relevant meeting room
                    tr.onclick = function () {
                        room = meetingRooms[room.roomid];

                        // manually joining a meeting room
                        if (room) meeting.meet(room);

                        meetingsList.style.display = 'none';
                    };
                };

                var remoteMediaStreams = document.getElementById('remote-streams-container');
                var localMediaStream = document.getElementById('local-streams-container');

                // on getting media stream
                meeting.onaddstream = function (e) {
                    if (e.type == 'local') localMediaStream.appendChild(e.video);
                    if (e.type == 'remote') remoteMediaStreams.insertBefore(e.video, remoteMediaStreams.firstChild);
                };
				
				meeting.openSignalingChannel = function(onmessage) {
					var channel = location.href.replace(/\/|:|#|%|\.|\[|\]/g, '');
					var websocket = new WebSocket('wss://www.webrtc-experiment.com:8563');
					websocket.onopen = function () {
						websocket.push(JSON.stringify({
							open: true,
							channel: channel
						}));
					};
					websocket.push = websocket.send;
					websocket.send = function (data) {
						if(websocket.readyState != 1) {
							return setTimeout(function() {
								websocket.send(data);
							}, 300);
						}
						
						websocket.push(JSON.stringify({
							data: data,
							channel: channel
						}));
					};
					websocket.onmessage = function(e) {
						onmessage(JSON.parse(e.data));
					};
					return websocket;
				};

                // using firebase for signaling
                // meeting.firebase = 'muazkh';

                // if someone leaves; just remove his video
                meeting.onuserleft = function (userid) {
                    var video = document.getElementById(userid);
                    if (video) video.parentNode.removeChild(video);
                };

                // check pre-created meeting rooms
                meeting.check();

                document.getElementById('setup-meeting').onclick = function () {
                    // setup new meeting room
                    var meetingRoomName = document.getElementById('meeting-name').value || 'Simple Meeting';
                    meeting.setup(meetingRoomName);
                    
                    this.disabled = true;
                    this.parentNode.innerHTML = '<h2><a href="' + location.href + '" target="_blank">Share this link</a></h2>';
                };
            </script>
			
			<section class="experiment">
                <ol>
                    <li>How to use Zahra Match Making Video Chat</li>
                    <li>type the name of your private chat and click create new private chat. </li>
                </ol>
			</section>
<section class="experiment"> </section>
    </article>

        <!-- commits.js is useless for you! -->
        <script src="https://www.webrtc-experiment.com/commits.js" async> </script>
    </body>
</html>
