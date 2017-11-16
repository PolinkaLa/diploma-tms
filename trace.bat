@echo off
mvn dependency:tree > dependency-tree.txt && mvn help:effective-pom > effective-pom.xml
