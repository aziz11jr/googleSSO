pipeline {
    agent any
        stages {
        
        stage('Git Checkout'){
            steps{
                script{
                    sh "git checkout $branch"
                }
            }
        }

        stage('BUILD') {
            steps {
                sh '''
                  #!/bin/sh
                  flutter --version
                  flutter upgrade
                  flutter clean
                  flutter packages get
                  flutter pub get
                  flutter build apk --flavor dev --debug -t lib/flavors/main_dev.dart
                  '''            }
        }
        stage('DISTRIBUTE') {
            steps {
                appCenter apiToken: 'b3c6a2d4c4d864c291401d91d4e94216a265127b',
                        ownerName: 'value.ds',
                        appName: 'VDS-Culture-Tech',
                        pathToApp: 'build/app/outputs/flutter-apk/app-dev-debug.apk',
                        distributionGroups: "$groups"
            }
        }
        stage('Clean'){
            steps{
                script{
                    cleanWs()
                }
            }
        }
    }
}