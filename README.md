
# 🚀 FindTheJob AI - Production Deployment Guide

## Project Overview

FindTheJob AI is a full-stack AI based job assistance platform.

Features:

- ATS Resume Analyzer
- Resume AI Optimizer
- Interview Question Generator
- FastAPI Backend
- React Frontend
- PostgreSQL Database
- Docker Containerization
- Jenkins CI/CD
- Kubernetes Deployment
- Nginx Reverse Proxy


# Architecture

```
User Browser
      |
      |
   Nginx Reverse Proxy
      |
 -------------------------
 |                       |
React Frontend        FastAPI Backend
                           |
                    ----------------
                    |              |
              PostgreSQL       AI Modules

GitHub
  |
Jenkins Pipeline
  |
Docker Build
  |
Kubernetes
  |
AWS EC2
```


# Technology Stack

## Frontend

- React
- Vite
- Axios
- Tailwind CSS


## Backend

- Python
- FastAPI
- REST API
- JWT Authentication


## Database

- PostgreSQL


## DevOps

- Git
- GitHub
- Docker
- Docker Compose
- Jenkins
- Kubernetes
- Nginx


# Folder Structure

```
FindTheJob/

backend/
 frontend/
 k8s/
 nginx/
 docker-compose.yml
 Jenkinsfile
 README.md
```


# Local Development Setup


## Step 1: Install Required Tools

Install Git:

Ubuntu:

```bash
sudo apt update

sudo apt install git -y
```


Install Python:

```bash
python3 --version
```


Install Node:

```bash
node --version
```


Install Docker:

```bash
sudo apt install docker.io -y

sudo systemctl enable docker

sudo systemctl start docker
```


Check:

```bash
docker --version
```


# Run Backend


Go backend:

```bash
cd backend
```


Create virtual environment:

```bash
python3 -m venv venv
```


Activate:

```bash
source venv/bin/activate
```


Install packages:

```bash
pip install -r requirements.txt
```


Start API:

```bash
uvicorn main:app --reload
```


Open:

```
http://localhost:8000/docs
```


# Run Frontend


Go frontend:

```bash
cd frontend
```


Install packages:

```bash
npm install
```


Start:

```bash
npm run dev
```


Open:

```
http://localhost:5173
```


# Docker Deployment


Build:

```bash
docker compose build
```


Start:

```bash
docker compose up -d
```


Check:

```bash
docker ps
```


Logs:

```bash
docker logs container_name
```


Stop:

```bash
docker compose down
```


# Production Deployment AWS EC2


## Step 1: Create EC2

Choose:

- Ubuntu 22.04
- Open ports:
    - 22 SSH
    - 80 HTTP
    - 443 HTTPS


Connect:

```bash
ssh ubuntu@SERVER_IP
```


## Step 2: Install Tools

```bash
sudo apt update

sudo apt install git docker.io docker-compose-plugin -y
```


## Step 3: Clone Project


```bash
git clone YOUR_GITHUB_REPO

cd FindTheJob
```


## Step 4: Start Application


```bash
docker compose up -d --build
```


Verify:

```bash
docker ps
```


# Nginx Setup


Install:

```bash
sudo apt install nginx -y
```


Restart:

```bash
sudo systemctl restart nginx
```


# Jenkins CI/CD


Install Java:

```bash
sudo apt install openjdk-21-jdk -y
```


Run Jenkins:

```bash
docker run -d \
--name jenkins \
-p 8080:8080 \
-p 50000:50000 \
jenkins/jenkins:lts
```


Open:

```
http://SERVER_IP:8080
```


Pipeline:

```
Git Checkout
      |
Build
      |
Test
      |
Docker Build
      |
Deploy
```


# Kubernetes Deployment


Install kubectl:

```bash
sudo apt install kubectl -y
```


Deploy:


```bash
kubectl apply -f k8s/
```


Check:

```bash
kubectl get pods
```


Services:

```bash
kubectl get svc
```


# Monitoring


Recommended:

- Prometheus
- Grafana


Metrics:

```
/metrics
```


# Troubleshooting


## Container not starting

Check:

```bash
docker logs container_name
```


## Port issue

Check:

```bash
sudo netstat -tulpn
```


## Backend not reachable

Test:

```bash
curl localhost:8000/health
```


# Git Workflow


Create branch:

```bash
git checkout -b feature
```


Commit:

```bash
git add .

git commit -m "update project"
```


Push:

```bash
git push origin feature
```


# Interview Explanation

Project Flow:

1. User opens React website
2. Frontend calls FastAPI APIs
3. Backend processes ATS/AI logic
4. Data stored in PostgreSQL
5. Docker packages application
6. Jenkins automates deployment
7. Kubernetes manages containers


# Author

FindTheJob AI Project
