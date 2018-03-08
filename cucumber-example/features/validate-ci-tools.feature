@pipeline
Feature: Validate whether the CI tools are properly integrated on the servers 
    As a continuous delivery engineer
    I would like to have the basic CI tools to be installed and configured correctly 
    so that that my applications on the servers will work as expected

    Background:

Scenario Outline: Validate CI tool installation
    Given I am testing the local environment
    When I run <command> 
    Then I should see <output>

    Examples:
 	
        | command         | output                  | 
 	    | "ruby -v"       | "ruby 2.4.1"            | 
        | "git --version" | "git version 2.14.3"    |
        | "mvn --version" | "mvn 3.1.1"             |
        | "java -version" | "java 1.8"              | 
    
Scenario: 