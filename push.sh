#!/bin/bash
read str
git add .
git commit -m "$str"
git push
