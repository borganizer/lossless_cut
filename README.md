# Lossless_Cut (MythTV)
The Lossless Cut userjobs are used in conjunction with MythTV's commflag and editing UI to create loss less cut mkv video files.
Lossless Cut supports multiple video, audio encoding types and subtitles formats.

https://www.mythtv.org/wiki/Lossless_Cut

# Changelog

Source is compatible with MythTV versions from 28.x (latest tested version 34.x)

Lossless_Cut v0.x:
- python 2

Lossless_Cut v3.x:
- python 3
- added --passthrough, no subtitle processing

### Installation Instructions (besides the instructions from the above link, Ubuntu 18.04)

```bash
  # Installing mkvtoolnix: not needed when -P (--passthrough) is used
  # https://mkvtoolnix.download/downloads.html
  
  sudo sh -c 'echo "deb https://mkvtoolnix.download/ubuntu/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/bunkus.org.list'
  wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | sudo apt-key add -
  apt update
  apt install mkvtoolnix 

  # Installing mediainfo
  apt install mediainfo
  
  # Install lossless_cut
  # installs python source to "/usr/share/lossless_cut"
  # install "/usr/bin/lossless_cut" (wrapper)
  sudo bash ./install.sh
```

### Usage

```
lossless_cut.py --usage

This script uses a MythTV cut list to create a loss less mkv video file from
MythTV recordings this includes:
Video encoded as with mpeg2 and h.264 (SD, 720p or 1080i HD)
Audio encoded as mp3 and AC3 (2ch and 5.1)
Subtitle encoded srt format or can be exported and converted into an srt file.

Recording devices such as HDPVR, HDHomeRun and MPEG2 from a DVB-T FreeView
transport.
For a complete list of supported recording devices check the wiki at:
    http://www.mythtv.org/wiki/lossless_cut

If a cutlist or skiplist has not been created then the whole mpg file is
copied into a mkv file container. In most cases a skip or cut list would
have been created before running this script as a userjob.

MythTV Userjob examples: (modify the path to the script so that it matches
your installation)
Export a loss less mkv file to a specific directory and leave the
original mpg file unchanged:

  /path to/script file/lossless_cut.py -f "%DIR%/%FILE%" -e

OR

Move a loss less mkv file to a specific local directory and leave the
original mpg file unchanged:

  /path to/script file/lossless_cut.py -f "%DIR%/%FILE%" -m "/move path"

OR

To create a loss less mkv file and replace the mpg with the mkv in the
MythTV database:

  /path to/script file/lossless_cut.py -f "%DIR%/%FILE%" -r

Mandatory command line parameter:
  -f "/path/filename.mpg"       MythTV recorded video path and file name
                                to be converted to a mkv file
  When this script is used as a MythTV user job always specify the
  file as: "%%DIR%%/%%FILE%%"

  One and only one of these three options MUST be selected:
  -e                            Export the final mkv video file to MythVideo,
                                including building any required sub directories.
  -m "/mkv directory path"      Specify directory path to move the final
                                mkv video file
  -r                            Replace the Recorded video file with the loss
                                less cut mkv file. Do not use this option unless
                                you are confident that the results of the cutting
                                process. Unlike the option -e and -m the original
                                recorded video is replaced.


Optional command line parameters:
  Most of these parameters can be set in the automatically
  generated "~/.mythtv/lossless_cut.cfg" configuration file.

  -a                            Do NOT add metadata with the MythTV grabbers
  -C                            Create individual files from each cut segment.
                                This is referred to as Concert Cuts.
  -D                            Delay option to change when the video track starts
                                by a positive (start sooner than other tracks)
                                or negative number (start later than other tracks)
                                in milliseconds. One second = 1000
                                This option should only be chosen by experienced users.
  -g                            Generate a cut list if one does not exist but there is
                                a skip list.
  -h or -u                      Display this help/usage text
  -j                            JobQueue ID "%JOBID%" of this UserJob.
  -k                            Keep the log file after the userjob
                                has completed successfully
  -l "/log directory path"      Specify a directory path to save the jobs
                                log file
  -s                            Display a summary of the options that would
                                be used during processing
                                but exit before processing begins. Used this
                                option for debugging. No changes to the mpg
                                file occurs.
  -P                            Passthrough, no subtitle processing
                                No need for: mkvtoolnix and ccextractor
                                Cannot be used with "-S" Strip option.
  -S                            Strip away any subtitle or secondary audio tracks
  -T                            Identifies a specific Audio track to copy in
                                conjunction with the "-S" Strip option.
                                Find the audio track numbers using a
                                "> mkvmerge -i file.mkv" command. If there is only
                                one audio track then this option is meaningless.
  -t                            Perform a test of the environment, display
                                success or failure then exit
  -v                            Display script's version, author's name and
                                purpose.
  -X                            Force use of mythccextractor as the primary
                                utility to extract and convert subtitles tracks
                                into srt format.
  -w "/working directory path"  Specify a working directory path to
                                manipulate the video file

This script requires the following to be installed and accessible:
  1) The "lossless_cut" directory must be installed on a MythTV backend
  2) The utilities: mythutil or mythcommflag
  3) When --passthrough is not used:
     The mkv utility suite "MKVToolNix" is installed. At least versions
    "v5.7.0" or higher. NOTE: Most Linux distros distribute older versions.
     Instructions to upgrading to the latest versions are at:
     Downloads: https://mkvtoolnix.download/downloads.html
     Source: https://mkvtoolnix.download/source.html
  4) The utility mediainfo is installed.
     Use version "MediaInfoLib - v0.7.5" or higher.
     PPA: https://launchpad.net/~shiki/+archive/mediainfo
     Downloads: http://mediainfo.sourceforge.net/en/Download
  5) A properly configured: config.xml or mysql.txt file.
```