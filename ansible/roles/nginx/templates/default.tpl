server {

    listen 80;
    server_name {{ nginx.servername }};
    root {{ nginx.docroot }};

    access_log /var/www/logs/access.log.txt;
    error_log  /var/www/logs/error.log.txt;

    index index.php;

    # Display nginx logs for specified server.
    location /logs {
        autoindex on;
        root /var/www;
        try_files $uri $uri/ =404;
    }

    # Display domain emails.
    location /mails {
        autoindex on;
        root /var/www;
        try_files $uri $uri/ =404;
    }

    # Try to serve image from imagecache folder first,
    # then (if not found) pass request to the backend.
    location ~ /sites/.*/files/styles/ {
        try_files $uri /index.php?q=$uri&$args;
        expires 24h;
    }

    location ~* ^.+\.(js|css)$ {
        expires -1;
        sendfile off;
    }

    location / {
        try_files $uri $uri/ /index.php?q=$uri&$args;
        expires max;
    }

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}