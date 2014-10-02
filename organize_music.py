#!/usr/bin/env python

import os, codecs, sys
from mutagen.id3 import ID3

music_path = "/Users/backalor/Music/songs"
cmus_playlist = "/Users/backalor/Music/playlists/newest-really.m3u"

curdir = os.path.abspath(os.getcwd())
mp3s = [filename for filename in os.listdir(curdir)
		if os.path.splitext(filename)[1] == ".mp3"]
if mp3s:
	# Make sure all the genre's are proper (ie, there is a directory that corresponds to each one)
	for filename in mp3s:
		audio = ID3(filename)
		if audio.has_key('TCON')==False:
			print "No Genre tag found for %s" % filename.decode("utf-8")
			sys.exit()
		genre = audio['TCON'].text[0]
		if not os.path.isdir(music_path + "/" + genre):
			print "ERR: %s directory not found. Fix %s and re-run" % (genre, filename)
			sys.exit()

	# Read in the existing playlist from cmus
	data = codecs.open(cmus_playlist, 'r', "utf-8").read()

	# Create a new playlist for these new songs
	playlist = codecs.open("playlist.pl", 'w', "utf-8")
	for filename in mp3s:
		audio = ID3(filename)
		genre = audio['TCON'].text[0]
		print u"Found Genre: %s for %s" % (genre, filename.decode("utf-8"))
		if (os.path.isdir(music_path + "/" + genre)):
			cmd = 'mv "%s" "%s"' % (filename.decode("utf-8"),  music_path + "/" + genre)
			os.system(cmd.encode("utf-8"))
			cmd = 'open "%s"' % (music_path + "/" + genre + "/" + filename.decode("utf-8"))
			os.system(cmd.encode("utf-8"))
			playlist.write(music_path + "/" + genre + "/" + filename.decode("utf-8"))
			playlist.write("\n")
		else:
			print "ERR: %s directory not found! This should never happen" % genre
	# Write the existing playlist from cmus at the bottom of the new playlist
	playlist.write(data)
	print "Check playlist.pl and if it looks fine manually copy it to ~/.cmus"
else:
	print "No .mp3 files found"
