#!/bin/bash

echo "Hi, it is now $(date)" >> "/home/ubuntu/gp_production/log.txt"

cd /home/ubuntu/gp_production/
git add .
git commit -m "Auto commit $(date)"
git push origin main
