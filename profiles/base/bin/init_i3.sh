#!/bin/bash
i3-msg "workspace 1; append_layout $HOME/.i3/w1_layout.json"
i3-msg "exec google-chrome-stable"
i3-msg "exec env LD_PRELOAD=/usr/lib/libcurl.so.3 /usr/bin/slack --disable-gpu"

