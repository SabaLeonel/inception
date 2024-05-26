echo "------------------------------- WORDPRESS START -----------------------------------"

php-fpm7.4 -v

echo "------------------\n"
mariadb -u $MYSQL_USER --password=$MYSQL_PASS -h mariadb -P 3306 -e "SHOW DATABASES;"
echo "------------------\n"

# Check if wordpress is already installed
if [ -e /var/www/wordpress/wp-config.php ]
then echo "wp-config already exists."
else
    
    # get wp-cli
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp    

    # Download wordpress
    cd /var/www/wordpress
    wp core download --allow-root

    # Configuration de wordpress : connection a la base de donnees et creation des users de wordpress
    wp config create --dbname=$MYSQL_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASS --dbhost=$WP_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --allow-root

fi

# Start php-fpm in the foreground
php-fpm7.4 -F