#!/bin/bash
# changeVolume

# Arbitrary but unique message id

volume="$(pamixer --get-volume-human)"

if [[ $@ == up ]]
then
	if [[ $volume == "muted" ]]
	then
		pamixer --toggle-mute
	fi
	pamixer --increase 5
elif [[ $volume != "muted" && $@ == down ]]
then
	if [[ $volume == "1%" ]]
	then
		pamixer --toggle-mute
	else
		pamixer --decrease 5
	fi
elif [[ $@ == mute ]]
then
	pamixer --toggle-mute
fi

volume="$(pamixer --get-volume-human)"

function send_to_dunst () {
  msgId="991049"
  dunstify -a "CHANGE_VOLUME_SCRIPT" -t 1000 -u low -i $1 -r "$msgId" $2
}

if [[ $volume == "0%" || $volume == "muted" ]]
then
  send_to_dunst audio-volume-muted "Volume Muted"
else
    send_to_dunst audio-volume-high "Volume: ${volume} $(getProgressString 10 '<b> </b>' ' ' ${volume//%})"
fi


# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
