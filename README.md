# terraform-jenkins-cucumber

For the script to run, please execute the below command:
gem install cucumber net-ssh opendelivery --no-ri --no-rdoc

Please set the environment variables for host, user and source /.bash_profile

Make sure you install 
gem install rspec-expectations

Version of cucumber - 3.1
Version of ruby - 2.4.1

Scenario: Is java 1.8 installed
        When I run "java -v"
        Then I should see "java 1.8"

    Scenario: Is maven 3.1 installed
        When I run "mvn --version"
        Then I should see "maven 1.3"
    
    Scenario: Is git 2.14.3 installed
        When I run "git --version"
        Then I should see "git 2.14.3"
