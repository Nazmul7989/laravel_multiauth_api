# laravel_multiauth_api

##  To run this project, please follow the instructions bellow:

## 1. Dependency
- This project requres PHP version 8
- Install redis to your local machine

 
### 2. Clone the repository locally.
### 3. Install Composer Dependencies.
```
composer install
```
### 4. Install NPM Dependencies.
```
npm install
```
### 5. Create a copy of your .env file.
```
copy .env.example .env
```
### 6. Generate an app encryption key.
```
php artisan key:generate
```

### 6. Configure .env file to connect database.
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel_multiauth_api
DB_USERNAME=root
DB_PASSWORD=

```

### 7. Configure .env file for queue connection.
```
BROADCAST_DRIVER=log
CACHE_DRIVER=redis
FILESYSTEM_DISK=local
QUEUE_CONNECTION=redis
SESSION_DRIVER=file
SESSION_LIFETIME=120
```

### 8. Configure .env file for mail send.
```
MAIL_MAILER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=
MAIL_PASSWORD=
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS="kinetik@gmail.com"
MAIL_FROM_NAME="${APP_NAME}"
```
### 9. Run server.
```
php artisan serve
```
### 10. Run Queue for Mail Sending.
```
php artisan queue:work
```
