export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export JEKYLL_GITHUB_TOKEN="330103c2f8b25f4a3301b5be3e0f56371a133301"
cd ~/dap-ailp-chatbot-help-platform && bundle install
echo "previous jekyll process"
ps -ef | grep jekyll
./shutdown.sh
JEKYLL_GITHUB_TOKEN="330103c2f8b25f4a3301b5be3e0f56371a133301" nohup bundle exec jekyll serve  > /dev/null 2>&1 &
echo "current jekyll process"
ps -ef | grep jekyll
exit
