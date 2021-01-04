#!/bin/bash
i3-msg "workspace 1; append_layout $HOME/.i3/w1_layout.json"
i3-msg "workspace 2; append_layout $HOME/.i3/w2_layout.json"
i3-msg "workspace 4; append_layout $HOME/.i3/w4_layout.json"
i3-msg "workspace 1"
i3-msg "exec intellij-idea-ultimate-edition"
i3-msg "exec firefox"


