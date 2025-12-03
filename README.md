# Resume
- [GDScript](#gdscript)
  - [Galaxy Generator](#galaxy-generator)
- [Python](#python)
  - [My Blender Utils](#my-blender-utils)
  - [Blender Batch Render](#blender-batch-render)
  - [Retrieving Data for Version Control](#retrieving-data-for-version-control)
- [Bash](#bash)
  - [Compress Images with MozJPEG](#compress-images-with-mozjpeg)
  - [Upgrade with Gotify Notification on Alpine](#upgrade-with-gotify-notification-on-alpine)
  - [Upgrade with Gotify Notification on Debian](#upgrade-with-gotify-notification-on-debian)
  - [Backup with Gotify Notification on Proxmox](#backup-with-gotify-notification-on-proxmox)
- [Javascript](#javascript)
  - [Minecraft Modification](#minecraft-modification)

## GDScript
### Galaxy Generator
[Dedicated repo link](https://github.com/SammySame/a-star-galaxy-generator) <br>
It includes a fully playable web game that uses A* path-finding and a custom-made node connection algorithm.
For an extensive write-up, please check the repo in the link above.

## Python
### My Blender Utils
[Dedicated repo link](https://github.com/SammySame/my-blender-utils) <br>
It is an add-on with a few automation scripts that can be run with just a click of a UI button.
For an extensive write-up, please check the repo in the link above.

### Blender Batch Render
[Source code](python/blender-batch-render.py) <br>
Used to automate rendering out a scene with different materials, resolutions, and camera angles.
The reiteration was very much improved with this script and allowed me to make
all the important changes requested by clients much more efficiently.

### Retrieving Data for Version Control
[Source code](python/get-mod-info.py) <br>
Really handy Python script, which helped me with version control without the need
to commit large JAR files into the repo. It does it by reading the text files that
were used for indexing in other software (Prism Launcher). It retrieves the file name,
file version number and a URL, which can come in two variants depending on the download source.
Finally, it exports all the data to the text file in a CSV-friendly format.

## Bash
### Compress Images with MozJPEG
[Source code](bash/compress-images-mozjpeg.sh) <br>
Automates the task of compressing images in a directory. The compression is lossy but
barely noticeable thanks to the MozJPEG that is a superset of libjpeg-turbo.
The user can pass arguments for source and output file extension, as well as output quality.
The progress of the script is echoed in the console, and at the end, information is shown
on how many images were successfully compressed.

### Upgrade with Gotify Notification on Alpine
[Source code](bash/autoupdate.conf) <br>
Send a Gotify notification after a successful package upgrade on the Alpine Linux distribution.
The message is also saved to a log file stored at /var/log/apk.log (configurable).
Using Cronjob to automate running the script is highly recommended.

### Upgrade with Gotify Notification on Debian
[Source code](bash/upgrade-gotify-debian.sh) <br>
Send a Gotify notification after a successful package upgrade on Debian distribution.
It is used with the unattended-upgrades package, which takes care of upgrading and updating once configured.
Using Cronjob to automate running the script is highly recommended.

### Backup with Gotify Notification on Proxmox
[Source code](bash/backup-gotify-proxmox.sh) <br>
Backup specified files at the /etc path, which should include all important config files.
The message from the backup is checked, and if an error is found, the notification recieves high priority.
All of the credentials are safely stored in an .env file, and the backup itself is encrypted.

## Javascript
### Minecraft Modification
[Source code](javascript/dimension-stacking.js) | 
[Example config](javascript/dimension-stacking-config.json) <br>
Minecraft is a 3D sandbox game with a huge modding community.
Thanks to the [KubeJS](https://www.curseforge.com/minecraft/mc-mods/kubejs) 
I utilized JavaScript to make changes to various base game mechanics.
In this instance, I created a system for moving between in-game
dimensions. Because the ability to teleport a player who is riding an entity
is non-existent in the base game, I have created a completely custom solution.
All of it is accompanied by a custom config file that can be used to create
many dimension teleporting rules. It can even handle modded dimensions.
