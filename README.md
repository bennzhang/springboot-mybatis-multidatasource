# springboot-mybatis-multidatasource
An example to show how `springboot`, `mybatis` dealing with `multiple datasources`. There are two datasources in the example. One is `mysql` and the other is `Oracle`.  If there is more than one datasouces, it is required to set one as `primary`. In this project, we set `mysql` as `primary`.  It can be easily extended to more datasources and other different kind of datasources.

 `MySQL JDBC driver` is straight forward and available in public Maven repository. But due to Oracle license restrictions, the `Oracle JDBC driver` is no longer available in the public Maven repository. To use the Oracle JDBC driver with Maven, you need to download and install it manually into your  local Maven repository.

## Install Oracle JDBC Driver
Visit [Oracle Website](http://www.oracle.com/technetwork/database/features/jdbc/index-091264.html), download ojdbc7.jar.

Run below to install locally
```
 mvn install:install-file -Dfile={Path/to/your/ojdbc7.jar}
      -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.1 -Dpackaging=jar  -DgeneratePom=true
```

Add those into your `pom.xml` file
```
        <!-- ojdbc7.jar  -->
        <dependency>
            <groupId>com.oracle</groupId>
            <artifactId>ojdbc7</artifactId>
            <version>12.1.0.1</version>
        </dependency>
```

## Set datasources
Setup datasource settings in the `application.properties` file

```
server.port=9090

# database 1 - mysql
db1.datasource.url=jdbc:mysql://localhost:3306/test
db1.datasource.username=test
db1.datasource.password=test
db1.datasource.driver-class-name=com.mysql.jdbc.Driver
db1.datasource.testWhileIdle=true
db1.datasource.validationQuery=SELECT 1

# database 2 - oracle
db2.datasource.url=jdbc:oracle:thin:@{HOST_NAME}:1521/{SERVICE_NAME}
db2.datasource.username={USERNAME}
db2.datasource.password={PASSWD}
db2.datasource.testWhileIdle=true
db2.datasource.driver-class-name=oracle.jdbc.OracleDriver
db2.datasource.validationQuery=SELECT 1 FROM DUAL
```

## Compile/Run Springboot service
```
mvn clean install
java -jar target/springboot-mybatis-multidatasource-0.0.1-SNAPSHOT.jar
```

### Import Test Data

```
springboot-mybatis-multidatasource\src\main\resources\mysql.sql
springboot-mybatis-multidatasource\src\main\resources\oracle.sql
```


## Test your webservice
http://localhost:9090/rest/db1/grades

```
[{"studentName":"Simon","subjectName":"History","grade":"A"},{"studentName":"Elenor","subjectName":"History","grade":"B+"},{"studentName":"Simon","subjectName":"Biology","grade":"B"},{"studentName":"Stu","subjectName":"Biology","grade":"F"},{"studentName":"Alvin","subjectName":"SF","grade":"C"},{"studentName":"Theo","subjectName":"SF","grade":"B"},{"studentName":"Stu","subjectName":"SF","grade":"C+"}]
```

http://localhost:9090/rest/db2/country
```
[{"country_id":"IT","country_name":"Italy","region_name":"Europe"},{"country_id":"JP","country_name":"Japan","region_name":"Asia"},{"country_id":"US","country_name":"United States of America","region_name":"Americas"},{"country_id":"CA","country_name":"Canada","region_name":"Americas"},{"country_id":"CN","country_name":"China","region_name":"Asia"},{"country_id":"IN","country_name":"India","region_name":"Asia"},{"country_id":"AU","country_name":"Australia","region_name":"Asia"},{"country_id":"ZW","country_name":"Zimbabwe","region_name":"Middle East and Africa"},{"country_id":"SG","country_name":"Singapore","region_name":"Asia"},{"country_id":"UK","country_name":"United Kingdom","region_name":"Europe"},{"country_id":"FR","country_name":"France","region_name":"Europe"},{"country_id":"DE","country_name":"Germany","region_name":"Europe"},{"country_id":"ZM","country_name":"Zambia","region_name":"Middle East and Africa"},{"country_id":"EG","country_name":"Egypt","region_name":"Middle East and Africa"},{"country_id":"BR","country_name":"Brazil","region_name":"Americas"},{"country_id":"CH","country_name":"Switzerland","region_name":"Europe"},{"country_id":"NL","country_name":"Netherlands","region_name":"Europe"},{"country_id":"MX","country_name":"Mexico","region_name":"Americas"},{"country_id":"KW","country_name":"Kuwait","region_name":"Middle East and Africa"},{"country_id":"IL","country_name":"Israel","region_name":"Middle East and Africa"},{"country_id":"DK","country_name":"Denmark","region_name":"Europe"},{"country_id":"HK","country_name":"HongKong","region_name":"Asia"},{"country_id":"NG","country_name":"Nigeria","region_name":"Middle East and Africa"},{"country_id":"AR","country_name":"Argentina","region_name":"Americas"},{"country_id":"BE","country_name":"Belgium","region_name":"Europe"}]
```

