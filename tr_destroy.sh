#!/bin/bash

REGIONNAME=$1
QTY=$2
EMAILID=$3
PAMENTREF=$4
  pwd
  cd $1-$3-$2-$4
  terraform destroy -var region=$1 -var vpc_name=$3-$2 -auto-approve 
