#!/usr/bin/env bash
#download and install miniconda
wget https://repo.continuum.io/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh &> Logfile.txt
chmod +x Miniconda3-4.5.4-Linux-x86_64.sh &>> Logfile.txt
bash ./Miniconda3-4.5.4-Linux-x86_64.sh -b -f -p /usr/local &>> Logfile.txt
echo "1. Conda Installed!"
#import the python system library and append the path
#import sys
#(sys.path.append("/usr/local/lib/python3.6/site-packages"))
#update conda while keeping python 3.6
! conda install --channel defaults conda python=3.6 --yes &>> Logfile.txt
! conda update --channel defaults --all --yes &>> Logfile.txt
echo "2. Conda Updated!"
#The instructions for this step come from https://docs.qiime2.org/2021.4/install/native/
wget https://data.qiime2.org/distro/core/qiime2-2021.4-py38-linux-conda.yml &>> Logfile.txt
conda env create -n qiime2-2021.4 --file qiime2-2021.4-py38-linux-conda.yml &>> Logfile.txt
#cleanup - removes the qiime2 yml
rm qiime2-2021.4-py36-linux-conda.yml &>> Logfile.txt
onda init &>> Logfile.txt
echo "3. Conda Initiated!"
echo "4. Qiime2 Install Complete! All Qiime2 cells must start with source activate qiime2-2021.4"