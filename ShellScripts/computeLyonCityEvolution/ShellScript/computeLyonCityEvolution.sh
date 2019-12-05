# !/bin/sh

# This script detects the changes between CityGML files representing the
# buildings of the city of Lyon at two different vintages and outputs the
# changes as graphML-JSON files.

# Awaited parameters:
# * output folder for the intermediate data and for the final result.
# * path to 3DUSE Build folder

# This script only works when invocated where it stands...
cd "$(dirname "$0")" || exit

# Check that parameters are correctly provided
if [ $# != 2 ]
  then
	  echo "Awaited parameters: output folder and path to 3DUSE build folder"
    exit 1
fi

# Create output directory
mkdir ${1}

# Download the data of the city of Lyon in 2009, 2012 and 2015 from the
# [Data Grand Lyon open portal](https://data.grandlyon.com/) and patch the
# errors in the files (e.g. buildings with empty geometry and textures with
# wrong coordinates).
./downloadPatchLyonCityGML.sh 2009 ${1}/Lyon_2009
./downloadPatchLyonCityGML.sh 2012 ${1}/Lyon_2012
./downloadPatchLyonCityGML.sh 2015 ${1}/Lyon_2015

# Split the buildings of 2009 and 2012 (2015 don't need splitting as the
# original buildings are already "splitted")
./splitBuildingsLyonCityGML.sh ${1}/Lyon_2009 2009 ${1}/Lyon_2009_Splitted ${2}
./splitBuildingsLyonCityGML.sh ${1}/Lyon_2012 2012 ${1}/Lyon_2012_Splitted ${2}

# Extract buildings of 2015 from original GrandLyon folders organization
mkdir ${1}/Lyon_2015_Splitted
cp ${1}/Lyon_2015/LYON_1ER_2015/LYON_1ER_BATI_2015.gml ${1}/Lyon_2015_Splitted
cp ${1}/Lyon_2015/LYON_2EME_2015/LYON_2EME_BATI_2015.gml ${1}/Lyon_2015_Splitted
cp ${1}/Lyon_2015/LYON_3EME_2015/LYON_3EME_BATI_2015.gml ${1}/Lyon_2015_Splitted
cp ${1}/Lyon_2015/LYON_4EME_2015/LYON_4EME_BATI_2015.gml ${1}/Lyon_2015_Splitted
cp ${1}/Lyon_2015/LYON_5EME_2015/LYON_5EME_BATI_2015.gml ${1}/Lyon_2015_Splitted
cp ${1}/Lyon_2015/LYON_6EME_2015/LYON_6EME_BATI_2015.gml ${1}/Lyon_2015_Splitted
cp ${1}/Lyon_2015/LYON_7EME_2015/LYON_7_BATI_2015.gml ${1}/Lyon_2015_Splitted/LYON_7EME_BATI_2015.gml
cp ${1}/Lyon_2015/LYON_8EME_2015/LYON_8EME_BATI_2015.gml ${1}/Lyon_2015_Splitted
cp ${1}/Lyon_2015/LYON_9EME_2015/LYON_9EME_BATI_2015.gml ${1}/Lyon_2015_Splitted

# Blend splitted buildings with remarkable buildings (which are normally already
# splitted)
./buildingBlender.sh ${1}

# extractBuildingDates: detect changes between two vintages of the city
./extractBuildingDates.sh 2009 ${1}/Lyon_2009_Splitted_With_Remarkable 2012 ${1}/Lyon_2012_Splitted_With_Remarkable ${1}/final_output ${2}
./extractBuildingDates.sh 2012 ${1}/Lyon_2012_Splitted_With_Remarkable 2015 ${1}/Lyon_2015_Splitted_With_Remarkable ${1}/final_output ${2}
