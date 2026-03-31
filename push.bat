git config --global http.proxy http://127.0.0.1:1081
git config --global https.proxy http://127.0.0.1:1081

cd D:\dotfiles
git config user.name "uuhasoolif"
git config user.email "lif@email.com"
git add .
git commit -m "sync: init opencode config with agents and skills"
git remote add origin https://github.com/uuhasoolif/opencode-dotfiles.git
git branch -M main
git push -u origin main