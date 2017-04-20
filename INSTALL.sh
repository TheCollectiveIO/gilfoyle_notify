#!/bin/bash
sudo apt-get install inotify-tools
sudo mv gilfoyle.sh /usr/bin
sudo chmod root:root /usr/bin/gilfoyle.sh
sudo chmod +x /usr/bin/gilfoyle.sh
sudo sed -i "\$i sh /usr/bin/gilfoyle_notify/gilfoyle.sh" /etc/rc.local

