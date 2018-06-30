function docker-gui
  set container_name "portainer"
  set portainer_port "9000"

  set container_id (docker ps --filter name=$container_name -a -q)

  if test -z $container_id
    docker run --name $container_name -p $portainer_port:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
  else
    docker start $container_name
  end

  open http://localhost:$portainer_port
end
