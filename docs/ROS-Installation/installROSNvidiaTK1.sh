#!/bin/bash
# Install Robot Operating System (ROS) on NVIDIA Jetson TK1
# Maintainer of ARM builds for ROS is http://answers.ros.org/users/1034/ahendrix/
# Information from:
# http://wiki.ros.org/NvidiaJetsonTK1
# http://wiki.ros.org/kinetic/Installation/UbuntuARM
# When asking questions or looking for help running ROS on NVIDIA Jetson TK1
# use the jetson_tk1 tag on ROS answers
# http://answers.ros.org/questions/scope:all/sort:activity-desc/tags:jetson_tk1/page:1/

# Setup Locale
sudo update-locale LANG=C LANGUAGE=C LC_ALL=C LC_MESSAGES=POSIX
# Setup sources.lst
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
# Setup keys
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
# Installation
sudo apt-get update
sudo apt-get install ros-kinetic-ros-base -y
# Add Individual Packages here
# You can install a specific ROS package (replace underscores with dashes of the package name):
# sudo apt-get install ros-kinetic-PACKAGE
# e.g.
# sudo apt-get install ros-kinetic-navigation
#
# To find available packages:
# apt-cache search ros-kinetic
# 
# Initialize rosdep
sudo apt-get install python-rosdep -y
sudo rosdep init
# To find available packages, use:
rosdep update
# Environment Setup
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
# Install rosinstall
sudo apt-get install python-rosinstall -y