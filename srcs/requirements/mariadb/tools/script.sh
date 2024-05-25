echo "------------------------------- MARIADB START -------------------------------------"

# Init the database
mysqld --initialize --user=mysql --datadir=/var/lib/mysql;

chown -R mysql:mysql /var/lib/mysql;
chown -R mysql:mysql /run/mysqld;

# Launch mariadb
mysqld --user=mysql --datadir=/var/lib/mysql &

# $! is the process id of the last command
pid=$!

# Wait for mariadb to start
sleep 3

# Setup the database
mysql -u root -p${MYSQL_ROOT_PASS} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';"
mysql -u root -p${MYSQL_ROOT_PASS} -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB_NAME};"
mysql -u root -p${MYSQL_ROOT_PASS} -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_PASS}';"
mysql -u root -p${MYSQL_ROOT_PASS} -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}';"
mysql -u root -p${MYSQL_ROOT_PASS} -e "FLUSH PRIVILEGES;"

# Show the databases
echo "------------------\n"
mysql -u root -p${MYSQL_ROOT_PASS} -e "SHOW DATABASES;"
echo "------------------\n"
mysql -u root -p${MYSQL_ROOT_PASS} -e "SELECT User FROM mysql.user"
echo "------------------\n"

# Kill the process mysqld
kill "$pid"

# Restart mariadb to replace the previous killed process
exec mysqld --user=mysql --datadir=/var/lib/mysql