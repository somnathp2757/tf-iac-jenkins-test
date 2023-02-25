REGIONNAME=$1
QTY=$2
EMAILID=$3
PAMENTREF=$4
  pwd
  mkdir $1-$3-$2-$4
  mv  ./main.tf $1-$3-$2-$4
  mv variables.tf $1-$3-$2-$4
  cd $1-$3-$2-$4
  terraform init
  terraform apply -var region=$1 -var email_id=$3 -var qty=$2 -auto-approve
