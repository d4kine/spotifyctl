#!/bin/bash
#
# spotifyctl.sh
#
# control spotify-player over CLI
#

S_PID=$(pidof -s spotify || pidof -s .spotify-wrapped)
if [ -z "$S_PID" ]; then
	/usr/bin/notify-send "Spotify not running..."
	exit 0	
fi


play() {
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play
}

pause() {
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
}

playpause_toggle() {
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
}

next() {
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
}

prev() {
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
}


case "$1" in
	play)
		play;;
	pause|stop)
		pause;;
	playpause_toggle)
		playpause_toggle;;
	next)
		next;;
	prev)
		prev;;
	
	*)
	echo "Usage: $0 (play|pause|stop|playpause_toggle|next|prev)";;
esac

