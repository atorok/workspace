#!/bin/bash
i3-msg "workspace 1; append_layout $HOME/.i3/w1_layout.json"
i3-msg "exec chromium"
i3-msg "exec skype"
i3-msg "exec slack"

