#!/bin/bash
export CI=true
git -C D:/dotfiles config user.name "uuhasoolif"
git -C D:/dotfiles config user.email "lif@email.com"
git -C D:/dotfiles config http.proxy "http://127.0.0.1:1081"
git -C D:/dotfiles config https.proxy "http://127.0.0.1:1081"
git -C D:/dotfiles add .
git -C D:/dotfiles commit -m "sync: init opencode config with agents and skills"
git -C D:/dotfiles remote add origin https://github.com/uuhasoolif/opencode-dotfiles.git
git -C D:/dotfiles branch -M main
git -C D:/dotfiles push -u origin main