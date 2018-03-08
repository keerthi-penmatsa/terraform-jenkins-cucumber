@pipeline
Feature: Scripted install of Jenkins
    As a continuous delivery engineer
    I would like Jenkins to be installed and configured correctly
    so that that my Jenkins server will work as expected

    Background:

    Given I am testing the local environment

    Scenario: Is ruby 2.4.1 installed
        When I run "ruby -v"
        Then I should see "ruby 2.4.1"
