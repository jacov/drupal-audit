#!/bin/bash

export DRUSH_ALIAS=$1
export AHT=$2

export ENVIRONMENT=`echo "$1" | sed -e 's/@//g'`

export TODAY=`date "+%Y-%m-%d"`
export OUTDIR="output"
export REPORT="${OUTDIR}/${TODAY}_${ENVIRONMENT}.html"


# MAIN

# create output dir
mkdir -p $OUTDIR


# initialize report & compose head
echo "<html>
<head>
	<title>Drupal Audit : $ENVIRONMENT : $TODAY</title>
<style>
* {
padding: 10px;
}

pre {
	display: block;
        padding: 0.5em 1em;
        border: 1px solid #bebab0;
	background: #faf8f0;
	font-family: "Courier 10 Pitch", Courier, monospace;
        font-size: 95%;
        line-height: 140%;
        white-space: pre;
        white-space: pre-wrap;
        white-space: -moz-pre-wrap;
        white-space: -o-pre-wrap;
}

p {
    font-family: "Times New Roman", Times, serif;
}
</style>


</head>
<body>


	<h1>Drupal Audit : $ENVIRONMENT : $TODAY</h1>

	<img src='https://s3.amazonaws.com/public-jacob/misc/drupal_logo.png' alt='Drupal Logo' height="18%" >

	<p>by: $USER </p>

" > $REPORT  



####
echo "<h2>Status Report</h2>" >> $REPORT
echo "<p>

# core-requirements     Provides information about things that may be wrong in your Drupal installation, if any.
# (status-report, rq)

</p>" >> $REPORT
echo "<pre>" >> $REPORT

	if test "$AHT" != ''
	then
		aht $DRUSH_ALIAS drush status-report | tee -a $REPORT
	else
		drush $DRUSH_ALIAS status-report | tee -a $REPORT
	fi

echo "</pre>" >> $REPORT
###

###
echo "<h2>UpdateDB Status</h2>" >> $REPORT
echo "<p>

# updatedb-status       List any pending database updates.

</p>" >> $REPORT
echo "<pre>" >> $REPORT

	if test "$AHT" != ''
	then
		aht $DRUSH_ALIAS drush updatedb-status | tee -a $REPORT
	else
		drush $DRUSH_ALIAS updatedb-status | tee -a $REPORT
	fi

echo "</pre>" >> $REPORT
###

###
echo "<h2>Locale Check</h2>" >> $REPORT
echo "<p>

# locale-check          Checks for available translation updates.

</p>" >> $REPORT
echo "<pre>" >> $REPORT

	if test "$AHT" != ''
	then
		aht $DRUSH_ALIAS drush locale-check | tee -a $REPORT
	else
		drush $DRUSH_ALIAS locale-check | tee -a $REPORT
	fi

echo "</pre>" >> $REPORT
###

###
echo "<h2>PM Update Status</h2>" >> $REPORT
echo "<p>

# pm-updatestatus       Show a report of available minor updates to Drupal core and contrib projects.
 (ups)


</p>" >> $REPORT
echo "<pre>" >> $REPORT

	if test "$AHT" != ''
	then
		aht $DRUSH_ALIAS drush pm-updatestatus | tee -a $REPORT
	else
		drush $DRUSH_ALIAS pm-updatestatus | tee -a $REPORT
	fi

echo "</pre>" >> $REPORT
###

###
echo "<h2>Search Status</h2>" >> $REPORT
echo "<p>

# search-status         Show how many items remain to be indexed out of the total.

</p>" >> $REPORT
echo "<pre>" >> $REPORT

	if test "$AHT" != ''
	then
		aht $DRUSH_ALIAS drush search-status | tee -a $REPORT
	else
	drush $DRUSH_ALIAS search-status | tee -a $REPORT
	fi

echo "</pre>" >> $REPORT
###

###
echo "<h2>Views Analyze</h2>" >> $REPORT
echo "<p>

# views-analyze (va)    Get a list of all Views analyze warnings

</p>" >> $REPORT
echo "<pre>" >> $REPORT

	if test "$AHT" != ''
	then
		aht $DRUSH_ALIAS drush views-analyze | tee -a $REPORT
	else
		drush $DRUSH_ALIAS views-analyze | tee -a $REPORT
	fi

echo "</pre>" >> $REPORT
###

###
echo "<h2>Watchdog List</h2>" >> $REPORT
echo "<p>

# watchdog-show        Show watchdog messages.

</p>" >> $REPORT
echo "<pre>" >> $REPORT

	if test "$AHT" != ''
	then
		aht $DRUSH_ALIAS drush watchdog-show | tee -a $REPORT
	else
		drush $DRUSH_ALIAS watchdog-show | tee -a $REPORT
	fi

echo "</pre>" >> $REPORT
###

###
echo "<h2>Cache Audit</h2>" >> $REPORT
echo "<p>

# cacheaudit            Show a report on configured cache settings.

</p>" >> $REPORT
echo "<pre>" >> $REPORT

	if test "$AHT" != ''
	then
		aht $DRUSH_ALIAS drush cacheaudit | tee -a $REPORT
	else
		drush $DRUSH_ALIAS cacheaudit | tee -a $REPORT
	fi

echo "</pre>" >> $REPORT
###




# close html
echo "</body>
</html>" >> $REPORT


# DONE
echo "
________________________________________________________________________

		=] 	Report is ready @ $REPORT	

"
	open $REPORT




