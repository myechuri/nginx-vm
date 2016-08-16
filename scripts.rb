def install_nginx()
    $script = <<SCRIPT
apk add --update nginx && rm -rf /var/cache/apk/*
mkdir -p /tmp/nginx/client-body
SCRIPT
    return $script
end

def setup_conf_files()
    $script = <<SCRIPT
mkdir -p /etc/nginx/conf.d
cat <<EOF > /etc/nginx/conf.d/default.conf
server {
  location / {
      root /usr/share/nginx/html;
  }

  location /item {
      alias /usr/share/nginx/html;
  }

  location /post {
      alias /usr/share/nginx/html;
  }
}
EOF
cat <<EOF > /etc/nginx/nginx.conf
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        off;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
EOF
mkdir -p /usr/share/nginx/html
cat <<EOF > /usr/share/nginx/html/index.html
<!doctype html>
<title>Alpine Docker and Nginx</title>

<h2>Website served by Nginx inside an Alpine VirtualBox VM</h2>

<script>
//app goes here
</script>
EOF
SCRIPT
    return $script
end

def start_nginx()
    $script =<<SCRIPT
nginx -g daemon off
SCRIPT
    return $script
end
