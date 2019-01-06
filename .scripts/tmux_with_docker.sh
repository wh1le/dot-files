#!/bin/sh

session_name="docker"

tmux new -d -s $session_name -c $(pwd) -n 'compose'
tmux send-keys -t "${session_name}:compose" "docker-compose up" Enter
tmux new-window -c $(pwd) -t 2 -n "code" 
tmux send-keys -t "${session_name}:code" "connect_to_logs" Enter
sleep 1
tmux send-keys -t "${session_name}:code" "vim" Enter

tmux attach

# tmux send-keys -t "docker:compose"

# tmux start \; new-session -d -s "docker" -c $(pwd) -n 'compose' \; send-keys -t "docker:compose" "docker-compose up" Enter \; new-window -n 'logs' 'connect_to_logs'
# tmux start \; new-session -d -s "docker" -c $(pwd) -n 'compose' \; send-keys -t docker:compose 'docker-compose up' Enter \; new-window -n 'docker:logs' 'connect_to_logs'
# tmux attach
