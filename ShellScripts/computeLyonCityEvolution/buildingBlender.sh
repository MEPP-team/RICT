# !/bin/sh

# This script uses UDV-server util named "CityGMLBuildingBlender" to integrate
# the buildings and remarkable buildings of each borrough of Lyon in 2009, 2012
# and 2015.

# Awaited parameters:
# * output folder where the intermediate data is (splitted buildings and
# remarkable buildings) and where the result of this script will be stored.

# This script only works when invocated where it stands...
cd "$(dirname "$0")" || exit

# Check that parameters are correctly provided
if [ $# != 1 ]
  then
	  echo "Awaited parameter: output folder where the intermediate data is
    (splitted buildings and remarkable buildings) and where the result of this
    script will be stored."
    exit 1
fi

# Clone UDV-server
git clone https://github.com/MEPP-team/UDV-server.git
pushd UDV-server/Utils/CityGMLBuildingBlender

# Install CityGMLBuildingBlender in a virtualenv
virtualenv -p python3 venv
. venv/bin/activate
pip install -r requirements.txt

# 2009
mkdir ${1}/Lyon_2009_Splitted_With_Remarkable

python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2009_Splitted/LYON_1ER_BATI_2009.gml ${1}/Lyon_2009/LYON_1ER_2009/LYON_1ER_BATI_REMARQUABLE_2009.gml --output ${1}/Lyon_2009_Splitted_With_Remarkable/LYON_1ER_BATI_2009.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2009_Splitted/LYON_2EME_BATI_2009.gml ${1}/Lyon_2009/LYON_2EME_2009/LYON_2EME_BATI_REMARQUABLE_2009.gml --output ${1}/Lyon_2009_Splitted_With_Remarkable/LYON_2EME_BATI_2009.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2009_Splitted/LYON_3EME_BATI_2009.gml ${1}/Lyon_2009/LYON_3EME_2009/LYON_3EME_BATI_REMARQUABLE_2009.gml --output ${1}/Lyon_2009_Splitted_With_Remarkable/LYON_3EME_BATI_2009.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2009_Splitted/LYON_4EME_BATI_2009.gml ${1}/Lyon_2009/LYON_4EME_2009/LYON_4_BATI_REMARQUABLE_2009.gml --output ${1}/Lyon_2009_Splitted_With_Remarkable/LYON_4EME_BATI_2009.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2009_Splitted/LYON_5EME_BATI_2009.gml ${1}/Lyon_2009/LYON_5EME_2009/LYON_5_BATI_REMARQUABLE_2009.gml --output ${1}/Lyon_2009_Splitted_With_Remarkable/LYON_5EME_BATI_2009.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2009_Splitted/LYON_6EME_BATI_2009.gml ${1}/Lyon_2009/LYON_6EME_2009/LYON_6EME_BATI_REMARQUABLE_2009.gml --output ${1}/Lyon_2009_Splitted_With_Remarkable/LYON_6EME_BATI_2009.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2009_Splitted/LYON_7EME_BATI_2009.gml ${1}/Lyon_2009/LYON_7EME_2009/LYON_7EME_BATI_REMARQUABLE_2009.gml --output ${1}/Lyon_2009_Splitted_With_Remarkable/LYON_7EME_BATI_2009.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2009_Splitted/LYON_8EME_BATI_2009.gml ${1}/Lyon_2009/LYON_8EME_2009/LYON_8EME_BATI_REMARQUABLE_2009.gml --output ${1}/Lyon_2009_Splitted_With_Remarkable/LYON_8EME_BATI_2009.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2009_Splitted/LYON_9EME_BATI_2009.gml ${1}/Lyon_2009/LYON_9EME_2009/LYON_9EME_BATI_REMARQUABLE_2009.gml --output ${1}/Lyon_2009_Splitted_With_Remarkable/LYON_9EME_BATI_2009.gml

# 2012
mkdir ${1}/Lyon_2012_Splitted_With_Remarkable

python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2012_Splitted/LYON_1ER_BATI_2012.gml ${1}/Lyon_2012/LYON_1ER_2012/LYON_1ER_BATI_REMARQUABLE_2012.gml --output ${1}/Lyon_2012_Splitted_With_Remarkable/LYON_1ER_BATI_2012.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2012_Splitted/LYON_2EME_BATI_2012.gml ${1}/Lyon_2012/LYON_2EME_2012/LYON_2EME_BATI_REMARQUABLE_2012.gml --output ${1}/Lyon_2012_Splitted_With_Remarkable/LYON_2EME_BATI_2012.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2012_Splitted/LYON_3EME_BATI_2012.gml ${1}/Lyon_2012/LYON_3EME_2012/LYON_3EME_BATI_REMARQUABLE_2012.gml --output ${1}/Lyon_2012_Splitted_With_Remarkable/LYON_3EME_BATI_2012.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2012_Splitted/LYON_4EME_BATI_2012.gml ${1}/Lyon_2012/LYON_4EME_2012/LYON_4EME_BATI_REMARQUABLE_2012.gml --output ${1}/Lyon_2012_Splitted_With_Remarkable/LYON_4EME_BATI_2012.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2012_Splitted/LYON_5EME_BATI_2012.gml ${1}/Lyon_2012/LYON_5EME_2012/LYON_5EME_BATI_REMARQUABLE_2012.gml --output ${1}/Lyon_2012_Splitted_With_Remarkable/LYON_5EME_BATI_2012.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2012_Splitted/LYON_6EME_BATI_2012.gml ${1}/Lyon_2012/LYON_6EME_2012/LYON_6EME_BATI_REMARQUABLE_2012.gml --output ${1}/Lyon_2012_Splitted_With_Remarkable/LYON_6EME_BATI_2012.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2012_Splitted/LYON_7EME_BATI_2012.gml ${1}/Lyon_2012/LYON_7EME_2012/LYON_7EME_BATI_REMARQUABLE_2012.gml --output ${1}/Lyon_2012_Splitted_With_Remarkable/LYON_7EME_BATI_2012.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2012_Splitted/LYON_8EME_BATI_2012.gml ${1}/Lyon_2012/LYON_8EME_2012/LYON_8EME_BATI_REMARQUABLE_2012.gml --output ${1}/Lyon_2012_Splitted_With_Remarkable/LYON_8EME_BATI_2012.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2012_Splitted/LYON_9EME_BATI_2012.gml ${1}/Lyon_2012/LYON_9EME_2012/LYON_9EME_BATI_REMARQUABLE_2012.gml --output ${1}/Lyon_2012_Splitted_With_Remarkable/LYON_9EME_BATI_2012.gml

# 2015
mkdir ${1}/Lyon_2015_Splitted_With_Remarkable

python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2015_Splitted/LYON_1ER_BATI_2015.gml --inputFolder ${1}/Lyon_2015/LYON_1ER_2015/LYON_1ER_BATI_REMARQUABLE/ --output ${1}/Lyon_2015_Splitted_With_Remarkable/LYON_1ER_BATI_2015.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2015_Splitted/LYON_2EME_BATI_2015.gml --inputFolder ${1}/Lyon_2015/LYON_2EME_2015/LYON_2EME_BATI_REMARQUABLE/ --output ${1}/Lyon_2015_Splitted_With_Remarkable/LYON_2EME_BATI_2015.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2015_Splitted/LYON_3EME_BATI_2015.gml --inputFolder ${1}/Lyon_2015/LYON_3EME_2015/LYON_3EME_BATI_REMARQUABLE/ --output ${1}/Lyon_2015_Splitted_With_Remarkable/LYON_3EME_BATI_2015.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2015_Splitted/LYON_4EME_BATI_2015.gml --inputFolder ${1}/Lyon_2015/LYON_4EME_2015/LYON_4EME_BATI_REMARQUABLE/ --output ${1}/Lyon_2015_Splitted_With_Remarkable/LYON_4EME_BATI_2015.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2015_Splitted/LYON_5EME_BATI_2015.gml --inputFolder ${1}/Lyon_2015/LYON_5EME_2015/LYON_5EME_BATI_REMARQUABLE/ --output ${1}/Lyon_2015_Splitted_With_Remarkable/LYON_5EME_BATI_2015.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2015_Splitted/LYON_6EME_BATI_2015.gml --inputFolder ${1}/Lyon_2015/LYON_6EME_2015/LYON_6EME_BATI_REMARQUABLE/ --output ${1}/Lyon_2015_Splitted_With_Remarkable/LYON_6EME_BATI_2015.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2015_Splitted/LYON_7EME_BATI_2015.gml --inputFolder ${1}/Lyon_2015/LYON_7EME_2015/LYON_7_BATI_REMARQUABLE/ --output ${1}/Lyon_2015_Splitted_With_Remarkable/LYON_7EME_BATI_2015.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2015_Splitted/LYON_8EME_BATI_2015.gml --inputFolder ${1}/Lyon_2015/LYON_8EME_2015/LYON_8EME_BATI_REMARQUABLE/ --output ${1}/Lyon_2015_Splitted_With_Remarkable/LYON_8EME_BATI_2015.gml
python CityGMLBuildingBlender.py --inputFiles ${1}/Lyon_2015_Splitted/LYON_9EME_BATI_2015.gml --inputFolder ${1}/Lyon_2015/LYON_9EME_2015/LYON_9_BATI_REMARQUABLE/ --output ${1}/Lyon_2015_Splitted_With_Remarkable/LYON_9EME_BATI_2015.gml

deactivate
popd
