# docker-compose up --build
source credentials.env

# Validate that the VirtualTourCode code is already there or not

if [ ! -e "VirtualTour" ]; then
    echo "CREATE DIR"
	mkdir VirtualTour
    echo "CHANGE DIR TO VIRTUAL TOUR"
	cd VirtualTour
    echo "PULLING CODE FROM GIT"
    echo "__________________________________________________________________"
	git init
    echo "INIT GIT"
    git config --global core.autocrlf input
    echo "CHANGE EOF SYNTAX"
    git remote add code https://github.com/kartik1997EB/VirtualTour.git 
    echo "ALIAS REMOTE ADDED"
    git pull code master
    echo "SOURCE PULLED FROM GIT"
	cd ..
    echo "BACK TO ROOT"
else
    echo "ALREADY HAVING VT CODE";
fi

if [ $EXEC_MODE = "dev" ]; then
    echo "Launching in Development Mode"
    echo "========================================================================="
    docker-compose up --build
else
    echo "Launching in Production Mode"
    echo "========================================================================="
    docker-compose -f docker-compose-prod.yaml up --build -d
fi

sleep 60
echo "Started Docker-Composed Network"
sleep 10