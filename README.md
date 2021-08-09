# php-nginx-container-sample
php-nginx-container-sample

## desc
php7.4-fpm 베이스의 php-nginx를 하나의 컨테이너에 빌드하는 샘플

### nginx 설정파일 수정

nginx/nginx-site.conf
```
  location / {
    fastcgi_pass localhost:9000;
    fastcgi_index url.php;
    include        fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root/index.php$fastcgi_script_name;
    fastcgi_buffer_size 4K;
    fastcgi_buffers 1024 4k;
    fastcgi_read_timeout 300;
  }

```
### 빌드

로컬
```
docker build -t test:v1 .
docker run -p8080:80 -t test:v1
```

GCP gcr 업로드
```
docker build --tag "gcr.io/sample/sample" .
docker push "gcr.io/sample/sample"
```
