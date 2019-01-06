#!/bin/bash

# https://github.com/nm1l0serd0v

# get all active services
all_docker_services=( $(docker-compose ps --services) )
# describe services that you ignore
excluded_services=(db redis)

array_index=0 

# filter elements
for element in "${all_docker_services[@]}"; do
  should_delete=false

  for target in "${excluded_services[@]}"; do
    if [[ "$element" = "$target" ]]; then
      should_delete=true
    fi
  done

  if [[ $should_delete = true ]]; then
    unset "all_docker_services[$array_index]"
  fi

  ((array_index+=1))
done

# for element in "${all_docker_services[@]}"; do
#   tmux rename-window 'logs'
#   tmux split-window -h "docker-compose logs -f --tail='all' ${element}"
# done

main_pane_opened=false

for element in "${all_docker_services[@]}"; do
  if [[ $main_pane_opened = false ]]; then
    tmux new-window -c $(pwd) -t 1 -n "logs" "docker-compose logs -f --tail='all' ${element}"
    main_pane_opened=true
  else
    tmux split-window -h "docker-compose logs -f --tail='all' ${element}"
  fi
done
