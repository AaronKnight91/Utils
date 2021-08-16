import argparse
from datetime import date
import os

def main(args):

    if args.year == "default":
        year = date.today().strftime("%Y")
    else:
        year = args.year

    print(year)
        
    parent_dir = '/media/aaron/External/Media/'
    child_dirs = ['Pictures','Videos']

    months = ['01_january','02_february','03_march','04_april','05_may','06_june',
              '07_july','08_august','09_september','10_october','11_november','12_december']
    
    for directory in child_dirs:
        path = os.path.join(parent_dir, directory)
        if not os.path.isdir(path):
            os.mkdir(path)
            
        path = os.path.join(path, year)
        if not os.path.isdir(path):
            os.mkdir(path)
            
        for month in months:
            tmp_path = os.path.join(path, month)
            if not os.path.isdir(tmp_path):
                os.mkdir(tmp_path)
    

def check_arguments():

    parse = argparse.ArgumentParser(description="Create directories to organise my media files in")

    parse.add_argument('--year','-y',help="The year to create directories for",type=str,
                       default="default")

    args = parse.parse_args()

    return args

if __name__ == "__main__":
    args = check_arguments()
    main(args)
