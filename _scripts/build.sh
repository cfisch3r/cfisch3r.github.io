#!/bin/bash

bundle exec jekyll build 
htmlproofer --assume-extension --url-ignore https://linkedin.com/in/christian-fischer-a89952102,http://deanattali.com/beautiful-jekyll/ ./_site

