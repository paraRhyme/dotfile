#!/bin/bash
polybar bottom & disown;
sleep 1;
i3-msg mode "[l]ogout | [p]ower | [r]eboot";
