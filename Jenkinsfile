
pipeline {
agent any

stages {

stage('Checkout'){
steps{
git 'YOUR_REPO_URL'
}
}

stage('Build'){
steps{
sh 'docker compose build'
}
}

stage('Deploy'){
steps{
sh 'docker compose up -d'
}
}

}
}
