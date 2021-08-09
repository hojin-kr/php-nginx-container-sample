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



GCP gcr 업로드 , 배포
```
gcloud builds submit --tag gcr.io/$PROJECT_ID/app --project $PROJECT_ID .
gcloud run deploy app --image=gcr.io/$PROJECT_ID/app  --namespace=$APP_NAME --project=$PROJECT_ID --region=us-central1 --port=80
```
deploy Options
https://cloud.google.com/sdk/gcloud/reference/run/deploy

no-taaffic으로 배포
```
gcloud run deploy app --image=gcr.io/$PROJECT_ID/$APP_NAME --namespace=$APP_NAME --project=$PROJECT_ID --region=$REGION --port=80 --no-traffic
```
트래픽 조정
https://cloud.google.com/sdk/gcloud/reference/run/services/update-traffic

```
cloud run services update-traffic app --namespace=a$APP_NAME --project=$PROJECT_ID --region=$REGION --to-revisions=LATEST=10
```

