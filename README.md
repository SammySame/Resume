# Resume
- [GDScript](#gdscript)
  - [Galaxy Generator](#galaxy-generator)
- [Javascript](#javascript)
  - [Minecraft Modification](#minecraft-modification)
- [Python](#python)
  - [My Blender Utils](#my-blender-utils)
  - [Blender Batch Render](#blender-batch-render)
  - [Retrieving Data for Version Control](#retrieving-data-for-version-control)
- [Bash](#bash)
  - [Upgrade with Gotify Notification on Alpine](#upgrade-with-gotify-notification-on-alpine)
  - [Upgrade with Gotify Notification on Debian](#upgrade-with-gotify-notification-on-debian)
  - [Backup with Notification on Proxmox Node](#backup-with-notification-on-proxmox-node)
  - [Compress Images with MozJPEG](#compress-images-with-mozjpeg)

## GDScript
### Galaxy Generator
[Dedicated repo link](https://github.com/SammySame/a-star-galaxy-generator) <br>
It includes a fully playable web game that uses A* path-finding and a custom-made node connection algorithm. <br>
For an extensive write-up, please check the repo in the link above.

## Javascript
### Minecraft Modification
[Source code](javascript/dimension-stacking.js) <br>
[Example config](javascript/dimension-stacking-config.json) <br>
Minecraft is a 3D sandbox game with a huge modding community.
Thanks to [KubeJS](https://www.curseforge.com/minecraft/mc-mods/kubejs)
modification for Minecraft, I utilized JavaScript to make changes
to various base game mechanics. <br>
In this instance, I created a system for moving between in-game
dimensions. Because the ability to teleport a player who is riding an entity
is non-existent in the base game, I have created a completely custom solution.
All of it is accompanied by a custom config file that can be used to create 
many dimension teleporting rules. It can even handle modded dimensions.

## Python
### My Blender Utils
[Dedicated repo link](https://github.com/SammySame/my-blender-utils) <br>
It is an add-on with a few automation scripts that can be run with just a click of a UI button. <br>
For an extensive write-up, please check the repo in the link above.

### Blender Batch Render
[Source code](python/blender-batch-render.py) <br>
Used to automate rendering out a scene with different
textures, several resolutions, and different camera angles.
It really helped me speed up with reiteration on the clients work.

### Retrieving Data for Version Control
[Source code](python/get-mod-info.py) <br>
Really handy Python script, which helped me with version control without the need
to commit large JAR files to the repo. It does it by reading the text files that
were used for indexing in other software (Prism Launcher). It retrieves the file name,
file version number and a URL, which can come in two variants depending on the download source.
Finally, it exports all the data to the text file in a CSV-friendly format.

## Bash
### Upgrade with Gotify Notification on Alpine
[Source code](bash/autoupdate.conf) <br>
Makes it possible to send a Gotify notification after a successful package upgrade on the Alpine Linux distribution.
The message is also saved to a log file stored at /var/log/apk.log (configurable). Using Cronjob to automate
running the script is recommended.

### Upgrade with Gotify Notification on Debian
[Source code](bash/upgrade-gotify-debian.sh) <br>
Makes it possible to send a Gotify notification after a successful package upgrade on Debian.
It is used with the unattended-upgrades package. Using Cronjob to automate
running the script is recommended.

### Backup with Notification on Proxmox Node
[Source code](bash/backup-gotify-proxmox.sh) <br>
Backup specified files at the /etc path. The message from the backup is checked
and if an error is found, the notification receives the highest priority. All the credentials
are safely stored in an .env file, and the backup itself is encrypted.

### Compress Images with MozJPEG
[Source code](bash/compress-images-mozjpeg.sh) <br>
Automates the task of compressing images in a directory.
The user can pass arguments for source and output file extension,
as well as quality between 0 and 100.
The progress of the script is echoed in the console.
At the end, information is shown on how many images were successfully compressed.
