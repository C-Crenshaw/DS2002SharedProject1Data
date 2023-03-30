use flights;

#https://rapidapi.com/flightera/api/flightera-flight-data/

SET @json = 
'[{"ident":"AA","icao":"AAL","iata":"AA","name":"American Airlines","callsign":"AMERICAN","country":"US","founding_date":"1926-04-15T00:00:00Z","start_date":"1936-06-25T00:00:00Z","website":"http://aa.com","alliance":"Oneworld"},
{"ident":"AS","icao":"ASA","iata":"AS","name":"Alaska Airlines","callsign":"ALASKA","country":"US","founding_date":"1932-04-14T00:00:00Z","start_date":"1944-06-06T00:00:00Z","website":"http://alaskaair.com","alliance":"Oneworld"},
{"ident":"EGF","icao":"EGF","iata":"MQ","name":"American Eagle","callsign":"EAGLEFLIGHT","country":"US"},{"ident":"MQ","icao":"ENY","iata":"MQ","name":"Envoy","callsign":"ENVOY","country":"US"},
{"ident":"EV","icao":"ASQ","iata":"EV","name":"ExpressJet Airlines","callsign":"ACEY","country":"US","founding_date":"1986-01-01T00:00:00Z","start_date":"1987-01-01T00:00:00Z","website":"http://www.expressjet.com/","alliance":"Star Alliance(United Express)"},
{"ident":"DL","icao":"DAL","iata":"DL","name":"Delta Air Lines","callsign":"DELTA","country":"US","founding_date":"1925-03-02T00:00:00Z","start_date":"1929-06-17T00:00:00Z","website":"http://delta.com","alliance":"SkyTeam/SkyTeam Cargo"},
{"ident":"F9","icao":"FFT","iata":"F9","name":"Frontier Airlines","callsign":"FRONTIER FLIGHT","country":"US","founding_date":"1994-02-08T00:00:00Z","start_date":"1994-07-05T00:00:00Z","website":"http://flyfrontier.com"},
{"ident":"HA","icao":"HAL","iata":"HA","name":"Hawaiian Airlines","callsign":"HAWAIIAN","country":"US","founding_date":"1929-01-30T00:00:00Z","start_date":"1929-10-06T00:00:00Z","website":"http://hawaiianairlines.com"},
{"ident":"B6","icao":"JBU","iata":"B6","name":"JetBlue Airways","callsign":"JETBLUE","country":"US","founding_date":"1998-08-01T00:00:00Z","start_date":"2000-02-11T00:00:00Z","website":"http://jetblue.com"},
{"ident":"OO","icao":"SKW","iata":"OO","name":"SkyWest Airlines","callsign":"SKYWEST","country":"US","founding_date":"1972-04-26T00:00:00Z","website":"https://skywest.com/","alliance":"Oneworld(as American Eagle)"},
{"ident":"WN","icao":"SWA","iata":"WN","name":"Southwest Airlines","callsign":"SOUTHWEST","country":"US","founding_date":"1967-03-15T00:00:00Z","start_date":"1971-06-18T00:00:00Z","website":"http://southwest.com"},
{"ident":"NK","icao":"NKS","iata":"NK","name":"Spirit Airlines","callsign":"SPIRIT WINGS","country":"US","founding_date":"1983-01-01T00:00:00Z","start_date":"1990-01-01T00:00:00Z","website":"http://spirit.com"},
{"ident":"UA","icao":"UAL","iata":"UA","name":"United Airlines","callsign":"UNITED","country":"US","founding_date":"1926-04-06T00:00:00Z","start_date":"1931-03-28T00:00:00Z","website":"https://united.com","alliance":"Star Alliance"},
{"ident":"US","iata":"US","name":"US Airways","founding_date":"1937-03-05T00:00:00Z","ceased_operations":"2015-10-17T00:00:00Z","website":"https://www.aa.com/homePage.do"},
{"ident":"VX","icao":"VRD","iata":"VX","name":"Virgin America","founding_date":"2004-01-26T00:00:00Z","start_date":"2007-08-08T00:00:00Z","website":"https://web.archive.org/*/http://www.virginamerica.com/"}]';

SELECT @json;

CREATE TABLE `airline_info`(
  `IATA_CODE` VARCHAR(40),
  `NAME` VARCHAR(100),
  `CALLSIGN` VARCHAR(100),
  `COUNTRY` VARCHAR(100),
  `FOUNDING_DATE` DATETIME NULL DEFAULT NULL,
  `WEBSITE` VARCHAR(100),
  `ALLIANCE` VARCHAR(100),
  FOREIGN KEY (`IATA_CODE`) REFERENCES `flights`.`airlines`(`IATA_CODE`),
  INDEX `NAME` (`NAME` ASC)
  );

INSERT INTO `airline_info`
    SELECT * FROM JSON_TABLE (@json, '$[*]' COLUMNS (
                `IATA_CODE` VARCHAR(40)  PATH '$.iata',
                `NAME` VARCHAR(100) PATH '$.name',
                `CALLSIGN` VARCHAR(100) PATH '$.callsign',
                `COUNTRY` VARCHAR(100) PATH '$.country',
                `FOUNDING_DATE` DATETIME PATH '$.founding_date',
                `WEBSITE` VARCHAR(100) PATH '$.website',
                `ALLIANCE` VARCHAR(100) PATH '$.alliance')) AS T;




