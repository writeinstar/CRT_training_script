"""
This is the robot listener to store each test status and elapsed time to a CSV file named with suitename
"""

import csv
import os
import pathlib
from datetime import datetime
import pandas as pd
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn


class q1_perf_listener(object):
    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'
    ROBOT_LISTENER_API_VERSION = 2

    def __init__(self):
        self.ROBOT_LIBRARY_LISTENER = self
        
        # Set CSV file headers
        self.headers = ['timestamp', 'kw_name', 'kw_status', 'kw_elapsed']

    def _start_suite(self, name, attrs):

        # Set path to csv file name (store to Jenkins WORKSPACE folder with suitename)
        parent_name, suite_name = attrs['longname'].split('.', maxsplit=1)
        self.path2_csv_file = f"{os.environ['WORKSPACE']}/{suite_name.replace(' ','_').lower()}.csv"

        # check file exist and is not empty to decide wether to record headers or not
        is_file_empty = (not pathlib.Path(self.path2_csv_file).exists()) or (pathlib.Path(self.path2_csv_file).stat().st_size == 0)

        # Append header to CSV file if file empty
        with open(self.path2_csv_file, 'a', encoding='UTF8', newline='') as csv_file:
            self.writer = csv.DictWriter(csv_file, delimiter=',', lineterminator='\n',fieldnames=self.headers)
            
            if is_file_empty :
                self.writer.writeheader()

    def _start_keyword(self,name,attrs):
        # Set keyword timeout if needed
        if 'Q1_PERF' in attrs['tags']:
            kw_name = f"{attrs['libname']}.{attrs['kwname']}"

            # If keyword as less than 2 rows in q1 perf data, Set timeout to 5 minutes (unable to compute mean)
            q1_perf_df = pd.read_csv(self.path2_csv_file)
            row_count = q1_perf_df.loc[q1_perf_df['kw_name'] == kw_name]['kw_name'].count()
            if row_count < 2:
                logger.info(f"Only {row_count} perf data which is not enough to compute mean for keyword:'{kw_name}', set timeout to 5 minutes ")
                BuiltIn().set_test_variable('${Q1_PERF_TIMEOUT}', '5 minutes')
            else:
                # Compute timeout from mean and standard deviation (mean + 2 x std) and convert to time string in milliseconds
                kw_mean = q1_perf_df.loc[q1_perf_df['kw_name'] == kw_name]['kw_elapsed'].mean().round(0)
                kw_std = q1_perf_df.loc[q1_perf_df['kw_name'] == kw_name]['kw_elapsed'].std().round(0)
                kw_timeout = f'{kw_mean + 2*kw_std} ms'
                logger.info(f"Found {row_count} perf data for keyword:'{kw_name}', mean={kw_mean}, std={kw_std}, set timeout to {kw_timeout}")
                BuiltIn().set_test_variable('${Q1_PERF_TIMEOUT}', kw_timeout)

    def _end_keyword(self, name, attrs):

        if 'Q1_PERF' in attrs['tags'] and attrs['status'] == 'PASS':

            # Set data to record to csv file
            data = {
                'timestamp': datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                'kw_name': f"{attrs['libname']}.{attrs['kwname']}",
                'kw_status': attrs['status'],
                'kw_elapsed': attrs['elapsedtime']
                }

            with open(self.path2_csv_file, 'a', encoding='UTF8', newline='') as csv_file:
                self.writer = csv.DictWriter(csv_file, delimiter=',', lineterminator='\n',fieldnames=self.headers)
                self.writer.writerow(data)
