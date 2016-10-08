docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes
docker rmi -f $(docker images -q)
./EDIT_AND_RUNME.sh down --rmi all --remove-orphans
./EDIT_AND_RUNME.sh pull
./EDIT_AND_RUNME.sh build
./EDIT_AND_RUNME.sh ps
