# Drupal Audit

This tool produces a quick and dirty report of some drush commands.

This should work for Drupal 7 & 8*

* d8 may have some errors still...

Reports will be generated in a folder, for example:
```
	open output/2016-12-13_wabee2.prod.html
```


## Usage
### With Drush Aliases
```
	git clone git@github.com:jacov/drupal-audit.git
	cd drupal-audit
	./drupal-audit.sh @site.prod
	./drupal-audit.sh @site.dev
```

### Without Drush Aliases 
```
	cd <drupal_path>
	git clone git@github.com:jacov/drupal-audit.git
	cd drupal-audit
	./drupal-audit.sh
```
* Note: if you are running without Drush Aliases, make sure to clean up output dir, or set it to a different location within the drupal-audit.sh. In the future i will put this in a config file.

### With Drush Aliases via aht
```
	git clone git@github.com:jacov/drupal-audit.git
	cd drupal-audit
	./drupal-audit.sh @site.prod aht
	./drupal-audit.sh @site.dev aht
```



![Alt](https://s3.amazonaws.com/public-jacob/misc/drupal_logo.png "Drupal")
