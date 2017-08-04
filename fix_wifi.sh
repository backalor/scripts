#!/bin/sh
sudo rmmod iwlmvm mac80211 iwlwifi cfg80211
sudo modprobe iwlmvm mac80211 iwlwifi cfg80211
sudo systemctl restart connman.service
