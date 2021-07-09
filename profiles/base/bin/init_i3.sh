#!/bin/bash
i3-msg "workspace 1; append_layout $HOME/.i3/w1_layout.json"
i3-msg "workspace 2; append_layout $HOME/.i3/w2_layout.json"
i3-msg "workspace 3; append_layout $HOME/.i3/w3_layout.json"
i3-msg "workspace 4; append_layout $HOME/.i3/w4_layout.json"
i3-msg "workspace 5; append_layout $HOME/.i3/w5_layout.json"
i3-msg "workspace 1"
i3-msg "exec run-on-ac intellij-idea-ultimate-edition"
i3-msg "exec firefox"
i3-msg "exec xfce4-terminal"


