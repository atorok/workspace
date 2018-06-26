#!/bin/bash
cd ~/pictures
exiftool -r '-FileName<CreateDate' -d '%m/NEF/%Y-%m-%d_%H_%M_%S%%-c.%%le'  100ND750
