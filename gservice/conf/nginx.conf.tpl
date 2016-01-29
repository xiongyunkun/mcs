user  www www;

worker_processes 10;

error_log  /data/logs/nginx_error.log  crit;

#pid        logs/nginx.pid;

#Specifies the value for maximum file descriptors that can be opened by this process.
worker_rlimit_nofile 51200;

events
{
	use epoll;

	worker_connections 51200;
}

http
{
	include       mime.types;
	default_type  application/octet-stream;

	#charset  gbk;
     
	server_names_hash_bucket_size 128;
	#client_header_buffer_size 32k;
	#large_client_header_buffers 4 32k;
	#client_max_body_size 8m;

	server_tokens off;

	expires       1h; 

	sendfile on;
	tcp_nopush     on;
	keepalive_timeout 60;
	tcp_nodelay on;

	error_page   404  /;

     fastcgi_connect_timeout 2;
     fastcgi_send_timeout 3;
     fastcgi_read_timeout 6;
     fastcgi_buffer_size 64k;
     fastcgi_buffers 4 64k;
     fastcgi_busy_buffers_size 128k;
     fastcgi_temp_file_write_size 128k;
     fastcgi_temp_path /dev/shm;

	gzip on;
	gzip_min_length  2048;
	gzip_buffers     4 16k;
	gzip_http_version 1.1;
	gzip_types  text/plain  text/css  text/html  application/xml application/x-javascript ;

	log_format  access  '$remote_addr - $remote_user [$time_local] "$request" '
                          '$status $body_bytes_sent "$http_referer" '
                          '"$http_user_agent" $http_x_forwarded_for';

#################  include  ###################

        server
        {
                listen 80;
                server_name empty;
                root /data/web/webclose;
        }


        server
        {
              listen       80;
              server_name  ##MINGCNSERVER## ;
              index index.html index.htm index.php;
              root  /data/web/awstats/www;

              location /status/ {
                   stub_status on;
                   access_log   off;
		   expires off;
              }

              location ~ .*\.php$
              {
                   include fcgi.conf;
                   fastcgi_pass  127.0.0.1:10080;
                   fastcgi_index index.php;
                   expires off;
              }
              access_log  /data/logs/##MINGCNSERVER##.log  access;
	}


	include block_ips.conf ;
	include vhost/mingchao.conf ;





} 
