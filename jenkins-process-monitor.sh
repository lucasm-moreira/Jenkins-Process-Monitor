#!/bin/bash

clear

#VARIÁVEIS DE DATA
data=$(date +%d/%m/%Y)
hora=$(date +%H:%M)

#VARIÁVEIS DO JENKINS
pidJenkins=$(pgrep -f JENKINS)
cpuJenkins=$(ps aux | grep JENKINS | awk '{print $3}' | sed '2d')
memJenkins=$(ps aux | grep JENKINS | awk '{print $4}' | sed '2d')
getProcessJenkins=$(pgrep -f JENKINS)

#VARIÁVEIS DO JOB PRODUCTION
pidApi=$(pgrep -f Production)
cpuApi=$(ps aux | grep 'Production' | awk '{print $3}' | sed '2d')
memApi=$(ps aux | grep 'Production' | awk '{print $4}' | sed '2d')
getProcessApi=$(pgrep -f Production)

#VARIÁVEIS DO JOB DEVELOP
pidApiDevelop=$(pgrep -f Develop)
cpuApiDevelop=$(ps aux | grep 'Develop' | awk '{print $3}' | sed '2d')
memApiDevelop=$(ps aux | grep 'Develop' | awk '{print $4}' | sed '2d')
getProcessApiDevelop=$(pgrep -f Develop)

if [ ! -z "$getProcessJenkins" ];
then
	echo""
        echo "##### JENKINS #####"
        echo ""
        echo "Consumo do JENKINS - $data - $hora"
        echo -e "PID: $pidJenkins"
        echo -e "%CPU: $cpuJenkins"
        echo -e "%MEM: $memJenkins"
        echo ""
else
        echo ""
        echo "##### JENKINS NÃO ESTÁ RODANDO! #####"
        echo ""
fi

if [ ! -z "$getProcessApi" ];
then
	echo ""
        echo "##### API - PRODUÇÃO #####"
        echo ""
        echo "Consumo da API PRODUÇÃO - $data - $hora"
        echo -e "PID: $pidApi"
        echo -e "%CPU: $cpuApi"
        echo -e "%MEM: $memApi"
        echo ""
else
        echo ""
        echo "##### API DE PRODUÇÃO NÃO ESTÁ RODANDO! #####"
        echo""
fi

if [ ! -z "$getProcessApiDevelop" ];
then
	echo ""
        echo "##### API - DEVELOP #####"
        echo ""
        echo "Consumo da API DEVELOP - $data - $hora"
        echo -e "PID: $pidApiDevelop"
        echo -e "%CPU: $cpuApiDevelop"
        echo -e "%MEM: $memApiDevelop"
        echo ""
else
        echo ""
        echo "##### API DEVELOP NÃO ESTÁ RODANDO! #####"
        echo""
fi
#DONE
