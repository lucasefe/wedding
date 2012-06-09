deploy:
	ssh neura "cd /var/apps/www.casamientochino.com.ar/current && git pull origin master && touch tmp/restart.txt"
