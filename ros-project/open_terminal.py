#!/usr/bin/env python

import time
from subprocess import call
from subprocess import Popen

Popen(["rosrun", "ros_tutorial", "publisher_tutorial"])
p = Popen(["rostopic", "echo", "/chatter"])

out, err = p.communicate()

print(out)

time.sleep(1)
