# WordPress Deployment Using Docker Compose

This project demonstrates how to deploy a complete WordPress environment using **Docker Compose**.  
It includes:

- **WordPress** (Web application)
- **MySQL** (Database)
- **phpMyAdmin** (Database management UI)
- Persistent volumes for data storage

This setup can be used for development, testing, or small-scale hosting.

---

## 🚀 Features

- Easy one-command deployment using Docker Compose  
- Persistent storage for WordPress and MySQL  
- Separate containers for WordPress, MySQL, phpMyAdmin  
- Environment variables managed through `.env` file  
- Optional folder for custom themes/plugins  
- SQL auto-import supported through `/sql` folder  

---

## 📁 Project Structure

wordpress-docker/
│
├── docker-compose.yml
├── .env
│
├── wordpress/ # Custom themes, plugins, uploads
│ └── (mounted to wp-content/)
│
├── sql/
│ └── init.sql # Auto-imported into MySQL (optional)
│
└── volumes/ # Auto-created Docker volumes
├── db_data/
└── wp_data/



---

## ⚙️ Environment Variables (.env)

Create a `.env` file:

MYSQL_DATABASE=wordpressdb
MYSQL_USER=wpuser
MYSQL_PASSWORD=wppassword
MYSQL_ROOT_PASSWORD=rootpass
WORDPRESS_TABLE_PREFIX=wp_



> ⚠️ Never push `.env` to GitHub. Add it to `.gitignore`.

---

## 🐳 Docker Compose Commands

### Start the project

docker-compose up -d

Stop all containers
docker-compose down

View running containers
docker-compose ps 

--------------------------------------------------------------------

Adding Custom Themes/Plugins

Place files here:

wordpress/themes/
wordpress/plugins/
wordpress/uploads/


These will be mounted automatically inside WordPress.

---------------------------------------------------------------------
