#!/usr/bin/env python3
# -*- coding: UTF8 -*-

import gi
import notify2
from gi.repository import GLib
from mpd import MPDClient

client = MPDClient()
client.timeout = 10
client.idletimeout = None
client.connect("localhost", 6600)

mpd_song = MPDClient.currentsong(client)

s_artist = mpd_song["artist"] if "artist" in mpd_song else ""
s_title  = mpd_song["title"]  if "title"  in mpd_song else ""
s_album  = mpd_song["album"]  if "album"  in mpd_song else ""

s_notification = "{} - {} {}".format(
    s_artist,
    s_title,
    f" - ({s_album})" if s_album else ""
)

notify2.init("Music Player Demon")
show_song = notify2.Notification("Music Player Daemon", s_notification,
    icon="~/.config/ncmpcpp/music-symbol.png")

show_song.set_hint("transient", True)

show_song.show()
