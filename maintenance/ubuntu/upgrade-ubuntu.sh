# Ubuntu 18.04.2
#!/bin/bash
/usr/sbin/service nginx stop
sudo -u www-data php /var/www/nextcloud/updater/updater.phar
sudo -u www-data php /var/www/nextcloud/occ status
sudo -u www-data php /var/www/nextcloud/occ -V
sudo -u www-data php /var/www/nextcloud/occ db:add-missing-indices
sudo -u www-data php /var/www/nextcloud/occ db:convert-filecache-bigint
sudo -u www-data sed -i "s/output_buffering=.*/output_buffering='Off'/" /var/www/nextcloud/.user.ini
sudo -u www-data php /var/www/nextcloud/occ app:update --all
/usr/sbin/service php7.3-fpm restart
/usr/sbin/service nginx restart
exit 0
