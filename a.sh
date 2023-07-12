docker run --name gitea --network=host -p 8080:3000 -d mygitea
sleep 2
docker exec --user git gitea touch /data/gitea/gitea.db
docker exec --user git gitea sed -i -e "s/^INSTALL_LOCK.*/INSTALL_LOCK=true/" /data/gitea/conf/app.ini
docker restart gitea
sleep 10 
docker exec gitea gitea admin user create --admin --username root --password admin1234 --email admin@example.co
