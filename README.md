# lossless_cut (MythTV)
The Lossless Cut userjobs are used in conjunction with MythTV's commflag and editing UI to create loss less cut mkv video files.
Lossless Cut supports multiple video, audio encoding types and subtitles formats.

https://www.mythtv.org/wiki/Lossless_Cut

Source is compatible with MythTV versions 28.x, 29.x.

#### 3. Installation Instructions (besides the instructions from the above link, Ubuntu 18.04)

```bash
  # Installing mkvtoolnix
  sudo sh -c 'echo "deb https://mkvtoolnix.download/ubuntu/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/bunkus.org.list'
  wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | sudo apt-key add -
  apt update
  apt install mkvtoolnix 

  # Installing mediainfo
  apt install mediainfo
```
