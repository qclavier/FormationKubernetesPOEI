#!/bin/bash

# Création du namespace
kubectl create namespace appvote

# Création des déploiements
## Création de la liste contenant tous les déploiements
deployment=("tpkubvot-pod-redisdata.yml","tpkubvot-pod-vote.yml","tpkubvot-pod-result.yml","tpkubvot-pod-worker.yml","tpkubvot-postgres.yml")

## Création des déploiement
for i in $deployment
do 
    kubectl create -f ${i}
done

# Création de services
## Création de la liste contenant tous les services
services=("tpkubvot-clusterIP-postgres.yml","tpkubvot-clusterIP-redis.yml","tpkubvot-node-port-result.yml","tpkubvot-node-port-vote.yml")

## Création des services
for j in $services
do 
    kubectl create -f ${j}
done

