#!/bin/bash

bundle exec jekyll build
htmlproofer --assume-extension --url-ignore https://linkedin.com/in/christian-fischer-a89952102,http://deanattali.com/beautiful-jekyll/,https://isqi.org/de/,https://www.activemind.de/datenschutz/datenschutzhinweis-generator/ ./_site
