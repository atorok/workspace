#!/bin/bash
i3-msg "workspace 1; append_layout $HOME/.i3/w1_layout.json"
i3-msg "workspace 2; append_layout $HOME/.i3/w2_layout.json"
i3-msg "workspace 1"
i3-msg "exec idea-ce-eap"
i3-msg "exec firefox"


