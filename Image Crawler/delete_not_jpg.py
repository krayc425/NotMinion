import argparse
import imghdr
import sys
import os
from os import listdir, remove

filepath = 'output'

def delete_not_jpg():
	for filename in filename_list:
	    fopen = open(filepath + "/" + filename)
	    imgType = imghdr.what(fopen)
	    if imgType is None or imgType.lower() not in ['jpg', 'jpeg', 'png']:
	        print filename + " is " + str(imgType) + ' and deleted'
	    	remove(filepath + "/" + filename)
	    fopen.close()
	return


def path_get():
    if sys.platform.startswith('win32'):
        path = os.getcwd()+'\\'+filepath+'\\'
    else:
        path = os.getcwd()+'/'+filepath+'/'
    return path


if __name__ == '__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument('-o', '--output', type=str, default=filepath, help='Output folder name. (Default: '+str(filepath)+')')
	args = parser.parse_args()
	filepath = args.output
	print(filepath)
	print('Output folder is: "'+path_get()+'"')
	filename_list = listdir(path_get())
	delete_not_jpg()