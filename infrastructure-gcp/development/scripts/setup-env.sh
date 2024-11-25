docker run \
  -e WUD_REGISTRY_GCR_CLIENTEMAIL="$(gcloud secrets versions access latest --secret=sa-creds-repo-poll  | jq -r '.client_email')" \
  -e WUD_REGISTRY_GCR_PRIVATEKEY="$(cat key.json)" \
  -e "WUD_TRIGGER_DOCKER_DEV_PRUNE=true" \
  -e WUD_WATCHER_LOCAL_CRON="*/15 * * * *" \
  -e WUD_WATCHER_LOCAL_WATCHBYDEFAULT="false" \
  -e  WUD_WATCHER_LOCAL_SOCKET="/var/run/docker.sock" \
  -e "WUD_SERVER_TLS_KEY=/certs/local-ip-key.pem" \
  -e "WUD_SERVER_TLS_CERT=/certs/local-ip-cert.pem" \
  -e "WUD_SERVER_TLS_ENABLED=true" \
  -v //var/run/docker.sock:/var/run/docker.sock \
  -v /wud-vol:/store \
  -v /home/waleedzafar_68/certs:/certs \
  -p 3000:3000 \
  getwud/wud



        docker run -d \
        --name backend-container \
        -p 5000:5000 \
        -e NODE_ENV=development \
        us-central1-docker.pkg.dev/imabulary/imabulary-dev/imabulary-dev:latest \
        npm run start:dev


bash echo -n "_json_key:$(gcloud secrets versions access latest --secret=sa-creds-repo-poll)" | base64 -w0

docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e WATCHTOWER_POLL_INTERVAL=300 \
    -v /home/waleedzafar_68/config.json:/config.json \
    containrrr/watchtower 
