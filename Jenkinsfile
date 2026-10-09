pipeline {
    agent any

    stages {
        stage('1. Pull Code') {
            steps {
                echo 'Checking out the latest source code from Git...'
                checkout scm
            }
        }

        stage('2. Run Tests') {
            steps {
                echo 'Initializing automated testing environment...'
                // Installs the testing tool and validates the python script
                sh 'pip3 install --break-system-packages pytest && pytest test_app.py'
            }
        }

        stage('3. Package Container') {
            steps {
                echo 'Quality checks passed! Packaging app into a Docker Alpine image...'
                sh 'docker build -t devops-app:latest .'
            }
        }

        stage('4. Verify Deployment') {
            steps {
                echo 'Launching container to verify output...'
                sh 'docker run --rm devops-app:latest'
            }
        }
    }

    post {
        success {
            echo '🎉 CI/CD Pipeline Completed Successfully!'
        }
        failure {
            echo '❌ Pipeline Failed. Issues detected in the latest commit.'
        }
    }
}
