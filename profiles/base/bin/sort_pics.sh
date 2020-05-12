#!/bin/bash
exiftool -r '-FileName<CreateDate' -d '%m/NEF/%Y-%m-%d_%H_%M_%S%%-c.%%le' $1
