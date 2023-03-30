# This document must be run third. This MYSQL code creates the fact table for the flights schema, building from the other
# tables that have been created, thus linking all the information together. 
# In order to join the marflights table with the date dimension information, make sure the safe updates preference is off.

CREATE TABLE `marflights` (
  `DATE` DATETIME NULL DEFAULT NULL,
  `AIRLINE` VARCHAR(1024),
  `FLIGHT_NUMBER` BIGINT,
  `TAIL_NUMBER` VARCHAR(1024),
  `ORIGIN_AIRPORT` VARCHAR(1024),
  `DESTINATION_AIRPORT` VARCHAR(1024),
  `ELAPSED_TIME` VARCHAR(1024),
  `AIR_TIME` VARCHAR(1024),
  `DISTANCE` BIGINT,
  `ARRIVAL_TIME` VARCHAR(1024),
  `DIVERTED` BIGINT,
  `CANCELLED` BIGINT,
  PRIMARY KEY (`FLIGHT_NUMBER`),
  INDEX `AIRLINE` (`AIRLINE` ASC),
  INDEX `ORIGIN_AIRPORT` (`ORIGIN_AIRPORT` ASC),
  INDEX `DESTINATION_AIRPORT` (`DESTINATION_AIRPORT` ASC),
  FOREIGN KEY (`AIRLINE`) REFERENCES `flights`.`airlines`(`IATA_CODE`),
  FOREIGN KEY (`ORIGIN_AIRPORT`) REFERENCES `flights`.`airports`(`IATA_CODE`),
  FOREIGN KEY (`DESTINATION_AIRPORT`) REFERENCES `flights`.`airports`(`IATA_CODE`),
  FOREIGN KEY (`FLIGHT_NUMBER`) REFERENCES `flights`.`passenger_flights`(`FLIGHT_NUMBER`));
  
  #Insert Data into Marflights
  INSERT INTO `marflights` VALUES
('2015-03-01','VX',1,'N837VA','SFO','DCA','286','271',2442,'1538',0,0),
('2015-03-01','B6',2,'N633JB','FLL','JFK','159','140',1069,'1140',0,0),
('2015-03-01','B6',3,'N913JB','JFK','SJU','202','181',1598,'1133',0,0),
('2015-03-01','AS',4,'N581AS','SEA','DCA','281','254',2329,'1553',0,0),
('2015-03-01','AS',5,'N517AS','DCA','LAX','343','326',2311,'1157',0,0),
('2015-03-01','AS',6,'N565AS','LAX','DCA','286','259',2311,'2041',0,0),
('2015-03-01','WN',7,'N670SW','DAL','HOU','56','46',239,'940',0,0),
('2015-03-01','AS',8,'N464AS','SEA','EWR','279','262',2402,'1548',0,0),
('2015-03-01','AA',9,'N792AA','JFK','LAX','397','368',2475,'1026',0,0),
('2015-03-02','HA',10,'N389HA','HNL','LAX','303','272',2556,'1513',0,0),
('2015-03-02','HA',11,'N384HA','SFO','HNL','331','305',2398,'1311',0,0),
('2015-03-02','VX',12,'N842VA','SFO','JFK','320','299',2586,'1522',0,0),
('2015-03-02','DL',14,'N823DN','SLC','ATL','215','185',1590,'1532',0,0),
('2015-03-02','B6',15,'N944JB','JFK','SFO','380','350',2586,'1019',0,0),
('2015-03-02','B6',16,'N934JB','SFO','JFK','316','299',2586,'1508',0,0),
('2015-03-02','HA',17,'N389HA','LAS','HNL','385','361',2762,'610',0,0),
('2015-03-02','HA',18,'N373HA','HNL','LAS','327','307',2762,'2330',0,0),
('2015-03-02','WN',19,'N749SW','LGA','DAL','245','228',1381,'1025',0,0),
('2015-03-02','WN',20,'N7734H','HRL','HOU','52','42',277,'1025',0,0),
('2015-03-03','HA',21,'N373HA','SEA','HNL','357','343',2677,'1258',0,0),
('2015-03-03','B6',22,'N521JB','PBI','BOS','187','168',1197,'1016',0,0),
('2015-03-03','B6',23,'N937JB','JFK','LAX','384','358',2475,'951',0,0),
('2015-03-03','B6',24,'N923JB','LAX','JFK','293','279',2475,'1413',0,0),
('2015-03-03','AA',25,'N3AVAA','BOS','LAX','405','381',2611,'1242',0,0),
('2015-03-03','VX',26,'N852VA','SFO','JFK','341','323',2586,'2223',0,0),
('2015-03-03','WN',27,'N252WN','LAX','DAL','172','158',1246,'1229',0,0),
('2015-03-03','B6',28,'N503JB','MCO','EWR','148','125',937,'1251',0,0),
('2015-03-03','HA',29,'N370HA','SEA','OGG','376','332',2640,'1410',0,0),
('2015-03-03','AS',30,'N514AS','PDX','BOS','294','277',2537,'1535',0,0),
('2015-03-04','AA',31,'N5ESAA','LAX','HNL','362','346',2556,'1230',0,0),
('2015-03-04','WN',32,'N747SA','STL','MDW','62','45',251,'844',0,0),
('2015-03-04','HA',33,'N385HA','LAX','OGG','362','329',2486,'1519',0,0),
('2015-03-04','AS',34,'N413AS','SEA','ORD','218','197',1721,'1423',0,0),
('2015-03-04','HA',35,'N589HA','PHX','HNL','414','396',2917,'1144',0,0),
('2015-03-04','AA',36,'N3EKAA','SAN','DFW','172','140',1171,'1420',0,0),
('2015-03-04','AS',37,'N469AS','MSP','SEA','235','194',1399,'1820',0,0),
('2015-03-04','AS',38,'N562AS','SEA','FLL','349','321',2717,'1746',0,0),
('2015-03-04','AS',39,'N459AS','MSP','SEA','216','197',1399,'831',0,0),
('2015-03-04','AA',40,'N3BYAA','DCA','ORD','126','111',612,'1101',0,0),
('2015-03-05','HA',41,'N391HA','SFO','OGG','318','298',2338,'1336',0,0),
('2015-03-05','AA',42,'N3GPAA','SEA','ORD','224','201',1721,'1433',0,0),
('2015-03-05','HA',43,'N590HA','SJC','HNL','350','329',2417,'1631',0,0),
('2015-03-05','AA',44,'N3AJAA','LAS','JFK','272','248',2248,'1535',0,0),
('2015-03-05','HA',45,'N592HA','SJC','OGG','328','313',2355,'1117',0,0),
('2015-03-05','DL',46,'N704X','JFK','SFO','386','343',2586,'1026',0,0),
('2015-03-05','HA',47,'N583HA','OAK','HNL','329','314',2409,'1252',0,0),
('2015-03-05','AA',48,'N3JXAA','SAN','DFW','164','141',1171,'1314',0,0),
('2015-03-05','B6',49,'N306JB','BOS','SAV','165','141',901,'1204',0,0),
('2015-03-05','AA',50,'N570AA','SLC','DFW','179','134',989,'1223',0,0),
('2015-03-06','B6',51,'N627JB','BOS','MCO','191','161',1121,'1047',0,0),
('2015-03-06','B6',52,'N653JB','MCO','BOS','199','152',1121,'1024',0,0),
('2015-03-06','AA',53,'N3LHAA','DCA','LAX','350','331',2311,'1128',0,0),
('2015-03-06','AA',54,'N3CWAA','LAS','ORD','193','170',1514,'1419',0,0),
('2015-03-06','AS',55,'N508AS','ANC','SCC','102','85',627,'848',0,0),
('2015-03-06','B6',56,'N190JB','IAD','BOS','80','66',413,'1345',0,0),
('2015-03-06','B6',57,'N348JB','BOS','IAD','94','73',413,'737',0,0),
('2015-03-06','AA',58,'N5DFAA','KOA','LAX','320','276',2504,'2120',0,0),
('2015-03-06','AA',59,'N5DFAA','LAX','KOA','352','332',2504,'1229',0,0),
('2015-03-06','AS',60,'N796AS','JNU','KTN','79','40',234,'838',0,0),
('2015-03-07','AA',61,'N850AA','MIA','DFW','192','167',1121,'931',0,0),
('2015-03-07','AS',62,'N792AS','ANC','JNU','110','87',571,'938',0,0),
('2015-03-07','AA',63,'N3ECAA','MIA','PHX','302','271',1972,'2257',0,0),
('2015-03-07','AA',64,'N3HXAA','DFW','JFK','187','169',1391,'1448',0,0),
('2015-03-07','AS',65,'N713AS','SEA','KTN','128','103',680,'855',0,0),
('2015-03-07','AA',66,'N631AA','SJU','JFK','247','221',1598,'1449',0,0),
('2015-03-07','AS',67,'N644AS','SEA','KTN','131','106',680,'1601',0,0),
('2015-03-07','AA',68,'N5EGAA','SFO','MIA','317','295',2585,'1520',0,0),
('2015-03-07','VX',69,'N636VA','IAD','SFO','362','328',2419,'1301',0,0),
('2015-03-07','B6',70,'N228JB','FLL','BOS','186','169',1237,'930',0,0),
('2015-03-08','AA',71,'N3GHAA','DFW','SAN','176','160',1171,'1859',0,0),
('2015-03-08','AA',72,'N5EKAA','DFW','MCO','142','120',985,'928',0,0),
('2015-03-08','AS',73,'N799AS','JNU','ANC','152','91',571,'955',0,0),
('2015-03-08','AA',74,'N505AA','DFW','CLE','','',1021,'',0,1),
('2015-03-08','AS',75,'N708AS','SEA','JNU','156','141',909,'1315',0,0),
('2015-03-08','AA',76,'N3HPAA','SFO','LAX','97','49',337,'900',0,0),
('2015-03-08','VX',77,'N841VA','IAD','SFO','364','345',2419,'2114',0,0),
('2015-03-08','AA',79,'N520AA','DFW','SMF','224','188',1431,'3',0,0),
('2015-03-08','DL',80,'N845MH','LAX','ATL','236','210',1947,'1609',0,0),
('2015-03-08','AS',81,'N577AS','SEA','ANC','224','195',1448,'841',0,0),
('2015-03-09','DL',82,'N957AT','MEM','ATL','77','52',332,'1411',0,0),
('2015-03-09','AA',83,'N4XBAA','MCO','DFW','174','146',985,'927',0,0),
('2015-03-09','AA',84,'N3AXAA','JFK','BOS','65','44',187,'839',0,0),
('2015-03-09','AS',85,'N764AS','SEA','ANC','220','198',1448,'1300',0,0),
('2015-03-09','AA',86,'N3GTAA','PDX','ORD','230','208',1739,'1251',0,0),
('2015-03-09','AA',87,'N490AA','ORD','RNO','228','213',1671,'2028',0,0),
('2015-03-09','AA',89,'N3KVAA','IAH','MIA','137','111',964,'935',0,0),
('2015-03-09','VX',90,'N633VA','SFO','IAD','288','268',2419,'2232',0,0),
('2015-03-09','AA',92,'N3KHAA','SAN','ORD','210','189',1723,'1430',0,0),
('2015-03-09','AA',93,'N3HHAA','ORD','SAN','222','210',1723,'1947',0,0),
('2015-03-10','AA',94,'N3ANAA','SAN','JFK','281','262',2446,'1551',0,0),
('2015-03-10','DL',95,'N320US','SLC','ATL','231','182',1590,'725',0,0),
('2015-03-10','AA',96,'N553AA','DFW','STL','94','70',550,'1005',0,0),
('2015-03-10','AA',97,'N3ENAA','DCA','DFW','210','185',1192,'1112',0,0),
('2015-03-10','AS',98,'N407AS','ANC','SEA','194','169',1448,'408',0,0),
('2015-03-10','B6',99,'N274JB','BDL','DCA','85','67',313,'732',0,0),
('2015-03-10','B6',100,'N594JB','LAX','FLL','289','274',2342,'626',0,0),
('2015-03-10','HA',101,'N492HA','ITO','HNL','51','39',216,'708',0,0),
('2015-03-10','HA',102,'N492HA','HNL','ITO','51','35',216,'543',0,0),
('2015-03-10','NK',103,'N616NK','BOS','MYR','134','112',738,'720',0,0),
('2015-03-11','HA',104,'N477HA','LIH','HNL','30','18',102,'651',0,0),
('2015-03-11','AS',105,'N440AS','SEA','ANC','208','194',1448,'1435',0,0),
('2015-03-11','AS',106,'N768AS','ANC','SEA','180','173',1448,'130',0,0),
('2015-03-11','HA',107,'N476HA','KOA','HNL','47','30',163,'707',0,0),
('2015-03-11','AS',108,'N309AS','ANC','SEA','194','173',1448,'455',0,0),
('2015-03-11','AS',109,'N556AS','SEA','ANC','209','195',1448,'2116',0,0),
('2015-03-11','F9',110,'N206FR','DEN','MSP','105','88',680,'956',0,0),
('2015-03-11','NK',111,'N522NK','DTW','LAS','277','262',1749,'851',0,0),
('2015-03-11','AS',112,'N527AS','ANC','SEA','202','179',1448,'1115',0,0),
('2015-03-11','HA',113,'N486HA','HNL','LIH','39','23',102,'636',0,0),
('2015-03-12','AS',114,'N303AS','ANC','SEA','199','176',1448,'628',0,0),
('2015-03-12','AA',115,'N3CTAA','LAX','MIA','276','255',2342,'839',0,0),
('2015-03-12','HA',116,'N492HA','HNL','OGG','40','21',100,'833',0,0),
('2015-03-12','F9',117,'N933FR','MSP','DEN','128','104',680,'646',0,0),
('2015-03-12','AA',118,'N788AA','LAX','JFK','286','268',2475,'1436',0,0),
('2015-03-12','WN',119,'N271LV','RSW','ATL','100','84',515,'934',0,0),
('2015-03-12','HA',120,'N491HA','HNL','KOA','44','28',163,'927',0,0),
('2015-03-12','NK',121,'N635NK','ORD','RSW','154','139',1120,'1205',0,0),
('2015-03-12','AS',122,'N413AS','ANC','PDX','201','187',1542,'507',0,0),
('2015-03-12','HA',123,'N476HA','HNL','LIH','42','24',102,'814',0,0),
('2015-03-13','AS',124,'N593AS','FAI','SEA','220','188',1533,'1054',0,0),
('2015-03-13','WN',125,'N358SW','SMF','DEN','167','141',909,'1204',0,0),
('2015-03-13','WN',126,'N256WN','OKC','PHX','161','133',833,'1112',0,0),
('2015-03-13','AA',127,'N3GHAA','IAD','DFW','230','200',1172,'912',0,0),
('2015-03-13','WN',128,'N731SA','HOU','LAX','206','189',1390,'1557',0,0),
('2015-03-13','AA',129,'N4WPAA','JAX','DFW','165','141',918,'833',0,0),
('2015-03-13','AS',130,'N457AS','FAI','SEA','218','186',1533,'545',0,0),
('2015-03-13','AS',131,'N528AS','PDX','ANC','234','210',1542,'1231',0,0),
('2015-03-13','HA',132,'N483HA','OGG','ITO','42','26',121,'1049',0,0),
('2015-03-13','F9',133,'N951FR','DFW','DEN','117','91',641,'759',0,0),
('2015-03-14','AS',134,'N464AS','ANC','SEA','198','170',1448,'558',0,0),
('2015-03-14','AS',135,'N527AS','SEA','ANC','215','199',1448,'259',0,0),
('2015-03-14','AS',136,'N431AS','ANC','SEA','','',1448,'',0,1),
('2015-03-14','WN',137,'N621SW','HOU','PHX','173','160',1020,'806',0,0),
('2015-03-14','F9',138,'N931FR','SEA','DEN','156','136',1024,'1342',0,0),
('2015-03-14','WN',139,'N651SW','GRR','STL','83','66',382,'927',0,0),
('2015-03-14','AA',140,'N621AA','SJU','MIA','161','139',1045,'1256',0,0),
('2015-03-14','AA',141,'N5EDAA','LAX','HNL','364','342',2556,'1806',0,0),
('2015-03-14','HA',142,'N489HA','HNL','ITO','49','35',216,'1708',0,0),
('2015-03-14','HA',143,'N480HA','HNL','LIH','44','24',102,'1132',0,0),
('2015-03-15','AS',144,'N514AS','ANC','PDX','209','182',1542,'619',0,0),
('2015-03-15','UA',145,'N76064','IAD','HNL','651','621',4817,'1606',0,0),
('2015-03-15','WN',146,'N7741C','ATL','MCO','81','63',404,'1833',0,0),
('2015-03-15','B6',147,'N659JB','OAK','LGB','76','63',353,'1019',0,0),
('2015-03-15','AA',148,'N3EJAA','MIA','CLT','120','96',650,'824',0,0),
('2015-03-15','B6',149,'N298JB','DCA','TPA','153','124',814,'1615',0,0),
('2015-03-15','WN',150,'N8642E','CMH','STL','91','76',409,'931',0,0),
('2015-03-15','NK',151,'N612NK','ACY','PBI','158','136',936,'1110',0,0),
('2015-03-15','B6',152,'N599JB','MCO','BOS','163','147',1121,'1327',0,0),
('2015-03-15','B6',153,'N746JB','JFK','PBI','161','144',1028,'2257',0,0),
('2015-03-16','B6',154,'N536JB','PBI','JFK','164','141',1028,'843',0,0),
('2015-03-16','HA',155,'N484HA','OGG','HNL','36','24',100,'845',0,0),
('2015-03-16','HA',156,'N484HA','HNL','OGG','34','20',100,'751',0,0),
('2015-03-16','AS',157,'N762AS','ANC','OTZ','100','78',548,'802',0,0),
('2015-03-16','WN',158,'N388SW','MDW','STL','59','45',251,'1248',0,0),
('2015-03-16','B6',159,'N193JB','BOS','PHL','84','61',280,'718',0,0),
('2015-03-16','AA',160,'N3KNAA','BOS','ORD','174','153',867,'1151',0,0),
('2015-03-16','F9',161,'N905FR','MSN','DEN','144','128',826,'658',0,0),
('2015-03-16','AS',162,'N792AS','FAI','ANC','80','44',261,'704',0,0),
('2015-03-16','NK',163,'N618NK','DFW','ATL','','',731,'',0,1),
('2015-03-17','AA',164,'N790AA','SFO','JFK','341','306',2586,'2044',0,0),
('2015-03-17','VX',165,'N639VA','EWR','LAX','389','357',2454,'1628',0,0),
('2015-03-17','AA',166,'N565AA','DFW','STL','104','68',550,'1410',0,0),
('2015-03-17','AA',167,'N359AA','MIA','SFO','364','345',2585,'1051',0,0),
('2015-03-17','NK',168,'N629NK','PHX','ORD','175','156',1440,'632',0,0),
('2015-03-17','AA',169,'N854AA','LAS','LAX','66','42',236,'1344',0,0),
('2015-03-17','WN',170,'N382SW','OAK','SEA','125','109',671,'1306',0,0),
('2015-03-17','DL',171,'N934DN','PHX','MSP','185','154',1276,'1426',0,0),
('2015-03-17','AS',172,'N577AS','ANC','PHX','323','298',2552,'1701',0,0),
('2015-03-17','HA',173,'N486HA','HNL','LIH','41','23',102,'1513',0,0),
('2015-03-18','VX',174,'N624VA','SFO','EWR','305','285',2565,'1559',0,0),
('2015-03-18','AA',175,'N3EWAA','DCA','DFW','','',1192,'',0,1),
('2015-03-18','NK',176,'N522NK','LAS','MSP','183','167',1299,'1443',0,0),
('2015-03-18','WN',177,'N267WN','LAX','OAK','92','56',337,'1925',0,0),
('2015-03-18','WN',178,'N485WN','BNA','LAS','254','232',1587,'928',0,0),
('2015-03-18','WN',179,'N7738A','LAX','MCI','186','169',1363,'1354',0,0),
('2015-03-18','NK',180,'N587NK','FLL','LGA','167','148',1076,'1519',0,0),
('2015-03-18','HA',181,'N493HA','ITO','HNL','59','44',216,'1359',0,0),
('2015-03-18','WN',182,'N765SW','OAK','SAN','84','65',446,'1207',0,0),
('2015-03-18','NK',183,'N521NK','LBE','RSW','153','135',956,'928',0,0),
('2015-03-19','WN',184,'N8603F','BWI','BOS','84','61',369,'1140',0,0),
('2015-03-19','B6',185,'N334JB','ROC','JFK','73','48',264,'703',0,0),
('2015-03-19','WN',186,'N378SW','CMH','MDW','67','55',283,'1011',0,0),
('2015-03-19','VX',187,'N630VA','EWR','SFO','373','349',2565,'1343',0,0),
('2015-03-19','NK',188,'N505NK','OAK','LAS','84','68',407,'715',0,0),
('2015-03-19','WN',189,'N391SW','SLC','MDW','201','168',1259,'1246',0,0),
('2015-03-19','AA',190,'N3FHAA','JFK','ORD','176','133',740,'957',0,0),
('2015-03-19','F9',191,'N925FR','FAR','DEN','132','115',627,'2144',0,0),
('2015-03-19','B6',192,'N645JB','TPA','BOS','185','157',1185,'1251',0,0),
('2015-03-19','NK',193,'N502NK','IAH','LAS','186','167',1222,'849',0,0),
('2015-03-20','WN',194,'N939WN','ISP','FLL','179','159',1092,'1003',0,0),
('2015-03-20','UA',195,'N69818','BDL','ORD','153','137',783,'814',0,0),
('2015-03-20','AA',196,'N3FBAA','MIA','PHL','174','148',1013,'858',0,0),
('2015-03-20','NK',197,'N633NK','LGA','FLL','179','150',1076,'1403',0,0),
('2015-03-20','B6',198,'N523JB','MCO','LGA','150','129',950,'827',0,0),
('2015-03-20','WN',199,'N494WN','TPA','DCA','125','110',814,'1017',0,0),
('2015-03-20','AS',200,'N767AS','SEA','SJC','124','99',697,'754',0,0),
('2015-03-20','AA',201,'N3LJAA','BOS','LAX','412','390',2611,'1045',0,0),
('2015-03-20','HA',202,'N491HA','HNL','ITO','53','36',216,'646',0,0),
('2015-03-20','WN',203,'N955WN','MCO','BNA','115','99',616,'821',0,0),
('2015-03-21','UA',204,'N810UA','DFW','IAH','69','43',224,'802',0,0),
('2015-03-21','HA',205,'N484HA','OGG','HNL','36','23',100,'637',0,0),
('2015-03-21','HA',206,'N484HA','HNL','OGG','36','20',100,'530',0,0),
('2015-03-21','UA',207,'N446UA','FLL','IAH','172','150',965,'806',0,0),
('2015-03-21','AA',208,'N355AA','LAX','MIA','285','264',2342,'1627',0,0),
('2015-03-21','NK',209,'N634NK','ORD','OAK','248','231',1836,'1742',0,0),
('2015-03-21','UA',210,'N830UA','MSP','DEN','120','100',680,'656',0,0),
('2015-03-21','UA',211,'N445UA','FLL','IAH','164','139',965,'955',0,0),
('2015-03-21','AA',212,'N5DHAA','OGG','LAX','304','280',2486,'2355',0,0),
('2015-03-21','B6',213,'N526JB','JFK','LGB','370','348',2465,'1707',0,0),
('2015-03-22','NK',214,'N632NK','LAS','DFW','147','128',1055,'529',0,0),
('2015-03-22','HA',215,'N481HA','OGG','HNL','47','25',100,'1441',0,0),
('2015-03-22','UA',216,'N816UA','SFO','SNA','78','59',372,'1508',0,0),
('2015-03-22','HA',217,'N485HA','KOA','HNL','45','31',163,'741',0,0),
('2015-03-22','HA',218,'N485HA','HNL','KOA','44','27',163,'624',0,0),
('2015-03-22','VX',219,'N843VA','AUS','SFO','225','202',1504,'944',0,0),
('2015-03-22','UA',220,'N813UA','MSY','EWR','160','140',1167,'946',0,0),
('2015-03-22','B6',221,'N197JB','BOS','PBI','191','170',1197,'1042',0,0),
('2015-03-22','AA',222,'N3JSAA','LAX','BOS','292','271',2611,'1442',0,0),
('2015-03-22','UA',223,'N816UA','SAT','IAH','50','31',191,'700',0,0),
('2015-03-23','NK',224,'N607NK','ORD','LGA','160','92',733,'927',0,0),
('2015-03-23','UA',225,'N401UA','EWR','IAH','245','219',1400,'1341',0,0),
('2015-03-23','B6',226,'N648JB','TPA','JFK','153','130',1005,'826',0,0),
('2015-03-23','AA',227,'N571AA','DFW','MSP','121','103',852,'2321',0,0),
('2015-03-23','UA',228,'N439UA','PDX','EWR','282','263',2434,'1329',0,0),
('2015-03-23','UA',229,'N428UA','IAD','SAN','331','312',2253,'1056',0,0),
('2015-03-23','UA',230,'N472UA','IAH','ORD','133','115',925,'929',0,0),
('2015-03-23','NK',231,'N620NK','ATL','FLL','100','80',581,'905',0,0),
('2015-03-23','B6',232,'N796JB','LGB','SLC','102','91',588,'1131',0,0),
('2015-03-23','AA',233,'N3BEAA','BWI','MIA','151','124',946,'914',0,0),
('2015-03-24','UA',234,'N838UA','SMF','IAH','227','193',1609,'1200',0,0),
('2015-03-24','WN',235,'N691WN','CAK','BOS','84','68',549,'833',0,0),
('2015-03-24','AA',236,'N3HLAA','SEA','JFK','301','277',2422,'1511',0,0),
('2015-03-24','UA',237,'N522UA','EWR','SFO','368','344',2565,'1957',0,0),
('2015-03-24','DL',238,'N995DL','DAB','ATL','71','58',366,'1138',0,0),
('2015-03-24','WN',239,'N653SW','SAT','STL','104','91',786,'743',0,0),
('2015-03-24','AS',240,'N569AS','SEA','SAN','161','133',1050,'910',0,0),
('2015-03-24','UA',241,'N429UA','TPA','ORD','168','147',1012,'1250',0,0),
('2015-03-24','AA',242,'N3DCAA','SFO','ORD','248','225',1846,'1426',0,0),
('2015-03-24','AA',243,'N3JRAA','MIA','SFO','357','340',2585,'2357',0,0),
('2015-03-25','AS',244,'N319AS','PDX','SFO','100','82',550,'904',0,0),
('2015-03-25','UA',245,'N807UA','CMH','ORD','82','56',296,'754',0,0),
('2015-03-25','DL',246,'N391DA','SAN','JFK','286','264',2446,'1428',0,0),
('2015-03-25','UA',247,'N462UA','PHX','IAH','160','118',1009,'1131',0,0),
('2015-03-25','AA',248,'N640AA','SEA','DFW','236','207',1660,'1457',0,0),
('2015-03-25','AA',249,'N4WLAA','DFW','COS','116','84',592,'1014',0,0),
('2015-03-25','UA',250,'N468UA','PDX','IAD','279','262',2327,'1546',0,0),
('2015-03-25','WN',251,'N521SW','AUS','DAL','53','36',189,'924',0,0),
('2015-03-25','B6',252,'N646JB','MCO','BOS','162','145',1121,'1629',0,0),
('2015-03-25','AA',253,'N378AA','LAX','OGG','353','332',2486,'1249',0,0),
('2015-03-26','AA',254,'N378AA','OGG','LAX','294','276',2486,'2150',0,0),
('2015-03-26','AA',255,'N794AA','JFK','LAX','389','352',2475,'1328',0,0),
('2015-03-26','UA',256,'N464UA','RSW','IAH','155','133',861,'735',0,0),
('2015-03-26','F9',257,'N932FR','DEN','SBA','132','117',916,'1424',0,0),
('2015-03-26','AA',258,'N3HYAA','LAX','MIA','281','258',2342,'756',0,0),
('2015-03-26','UA',259,'N427UA','SNA','IAH','177','156',1346,'1150',0,0),
('2015-03-26','UA',260,'N403UA','SEA','IAD','266','253',2306,'2050',0,0),
('2015-03-26','F9',261,'N952FR','DEN','SNA','139','111',846,'937',0,0),
('2015-03-26','B6',262,'N627JB','SJU','BOS','243','224',1674,'619',0,0),
('2015-03-26','WN',263,'N782SA','BWI','ECP','138','127',798,'1401',0,0),
('2015-03-27','UA',264,'N839UA','SFO','PHX','110','89',651,'1152',0,0),
('2015-03-27','AA',265,'N5ECAA','LAX','LIH','373','355',2615,'1327',0,0),
('2015-03-27','AA',266,'N5ECAA','LIH','LAX','325','299',2615,'2229',0,0),
('2015-03-27','WN',267,'N784SW','SAT','PHX','143','128',843,'1059',0,0),
('2015-03-27','F9',268,'N921FR','SNA','DEN','144','114',846,'1002',0,0),
('2015-03-27','B6',269,'N834JB','BOS','FLL','197','174',1237,'924',0,0),
('2015-03-27','UA',270,'N479UA','BWI','DEN','256','237',1491,'1026',0,0),
('2015-03-27','B6',271,'N556JB','LGA','FLL','161','144',1076,'1210',0,0),
('2015-03-27','B6',272,'N556JB','FLL','LGA','164','143',1076,'843',0,0),
('2015-03-27','WN',274,'N232WN','LAS','SMF','86','66',397,'2023',0,0),
('2015-03-28','UA',275,'N598UA','LAX','JFK','300','277',2475,'1606',0,0),
('2015-03-28','HA',276,'N489HA','HNL','OGG','52','26',100,'1244',0,0),
('2015-03-28','WN',277,'N658SW','MSY','MCO','89','74',551,'1115',0,0),
('2015-03-28','UA',278,'N826UA','SFO','SEA','121','98',679,'1036',0,0),
('2015-03-28','B6',279,'N796JB','LAS','LGB','58','40',231,'758',0,0),
('2015-03-28','B6',280,'N562JB','LGB','LAS','65','47',231,'1006',0,0),
('2015-03-28','AA',281,'N3FXAA','MIA','DFW','194','166',1121,'813',0,0),
('2015-03-28','UA',282,'N821UA','DEN','EWR','195','175',1605,'1629',0,0),
('2015-03-28','AA',283,'N5DJAA','LAX','HNL','390','358',2556,'1455',0,0),
('2015-03-28','UA',284,'N832UA','PHX','SFO','121','89',651,'852',0,0),
('2015-03-29','HA',285,'N480HA','OGG','HNL','35','23',100,'738',0,0),
('2015-03-29','HA',286,'N480HA','HNL','OGG','40','22',100,'640',0,0),
('2015-03-29','B6',287,'N793JB','BOS','LAX','394','373',2611,'1131',0,0),
('2015-03-29','B6',288,'N806JB','LAX','BOS','292','272',2611,'1445',0,0),
('2015-03-29','B6',289,'N373JB','BOS','DCA','84','68',399,'814',0,0),
('2015-03-29','B6',290,'N274JB','DCA','BOS','81','63',399,'950',0,0),
('2015-03-29','HA',291,'N492HA','ITO','HNL','62','40',216,'1548',0,0),
('2015-03-29','WN',292,'N951WN','MCI','DCA','115','102',949,'1434',0,0),
('2015-03-29','WN',293,'N419WN','OAK','SNA','73','63',371,'1514',0,0),
('2015-03-29','AA',294,'N4YDAA','DFW','ORF','153','136',1212,'1628',0,0),
('2015-03-30','F9',295,'N202FR','TPA','DEN','234','214',1506,'944',0,0),
('2015-03-30','UA',296,'N470UA','ORD','DEN','159','131',888,'845',0,0),
('2015-03-30','UA',297,'N544UA','LAX','LIH','351','334',2615,'1304',0,0),
('2015-03-30','NK',298,'N514NK','LAS','IAH','170','148',1222,'630',0,0),
('2015-03-30','AA',299,'N857AA','MIA','DEN','264','242',1709,'923',0,0),
('2015-03-30','UA',300,'N818UA','CLE','SFO','307','285',2161,'922',0,0),
('2015-03-30','NK',301,'N626NK','BWI','FLL','142','125',925,'911',0,0),
('2015-03-30','AA',302,'N3CMAA','ORD','DEN','147','125',888,'1215',0,0),
('2015-03-30','WN',303,'N735SA','STL','LAS','208','194',1371,'837',0,0),
('2015-03-30','B6',304,'N607JB','SJU','JFK','248','231',1598,'501',0,0),
('2015-03-31','HA',305,'N485HA','OGG','HNL','40','26',100,'1202',0,0),
('2015-03-31','AA',306,'N859AA','LAX','MIA','280','257',2342,'1539',0,0),
('2015-03-31','UA',307,'N488UA','BWI','LAX','342','323',2329,'2200',0,0),
('2015-03-31','F9',308,'N935FR','GEG','DEN','133','108',836,'931',0,0),
('2015-03-31','WN',309,'N657SW','BWI','HOU','211','198',1246,'929',0,0),
('2015-03-31','AA',310,'N201AA','MFE','DFW','','',469,'',0,1),
('2015-03-31','AS',311,'N705AS','PSP','SFO','85','67',421,'816',0,0),
('2015-03-31','UA',312,'N833UA','EWR','LAX','384','340',2454,'1020',0,0),
('2015-03-31','AS',313,'N703AS','SFO','SEA','121','97',679,'852',0,0),
('2015-03-31','AA',314,'N585AA','DFW','ATL','139','90',731,'1127',0,0),
('2015-03-01','AA',315,'N3MAAA','LGA','ORD','165','136',733,'843',0,0),
('2015-03-01','NK',316,'N601NK','DTW','LGA','158','67',502,'836',0,0),
('2015-03-01','WN',317,'N222WN','ATL','DAL','138','124',721,'839',0,0),
('2015-03-01','B6',318,'N183JB','JFK','BOS','66','38',187,'744',0,0),
('2015-03-01','UA',319,'N498UA','EWR','MCO','152','135',937,'835',0,0),
('2015-03-01','AS',320,'N622AS','SEA','SFO','125','97',679,'807',0,0),
('2015-03-01','AS',321,'N613AS','SJC','SEA','113','100',697,'840',0,0),
('2015-03-01','WN',322,'N7703A','SEA','PHX','157','143',1107,'1052',0,0),
('2015-03-01','AA',323,'N520AA','DFW','STL','','',550,'',0,1),
('2015-03-02','UA',324,'N516UA','LAX','IAD','256','241',2288,'1823',0,0),
('2015-03-02','AA',325,'N3LWAA','LGA','ORD','168','136',733,'1121',0,0),
('2015-03-02','B6',326,'N639JB','TPA','JFK','161','135',1005,'1004',0,0),
('2015-03-02','DL',327,'N692DL','PHL','ATL','126','103',666,'814',0,0),
('2015-03-02','AA',328,'N4XKAA','DEN','DFW','138','96',641,'941',0,0),
('2015-03-02','AS',329,'N568AS','SJC','SEA','118','101',697,'1158',0,0),
('2015-03-02','AA',330,'N3EWAA','PBI','ORD','202','171',1144,'848',0,0),
('2015-03-02','UA',331,'N403UA','ORD','SEA','260','233',1721,'1231',0,0),
('2015-03-02','HA',332,'N483HA','HNL','ITO','56','33',216,'834',0,0),
('2015-03-02','DL',333,'N918DH','MSP','MIA','201','176',1501,'1350',0,0),
('2015-03-03','AA',334,'N494AA','DFW','MFE','','',469,'',0,1),
('2015-03-03','WN',335,'N226WN','SJC','SNA','75','56',342,'1147',0,0),
('2015-03-03','WN',336,'N490WN','SAN','SEA','170','148',1050,'1045',0,0),
('2015-03-03','AS',337,'N786AS','SJC','SEA','118','101',697,'1005',0,0),
('2015-03-03','HA',338,'N481HA','HNL','KOA','44','27',163,'723',0,0),
('2015-03-03','UA',339,'N576UA','BOS','DEN','305','255',1754,'1201',0,0),
('2015-03-03','VX',340,'N631VA','SFO','FLL','327','305',2583,'1643',0,0),
('2015-03-03','DL',341,'N343NB','GSO','ATL','76','52',306,'843',0,0),
('2015-03-03','AS',342,'N440AS','SEA','OAK','108','92',671,'743',0,0),
('2015-03-03','WN',343,'N8649A','MDW','PHX','251','224',1444,'936',0,0),
('2015-03-04','F9',344,'N932FR','BZN','DEN','90','70',524,'743',0,0),
('2015-03-04','AS',345,'N469AS','OAK','SEA','113','95',671,'801',0,0),
('2015-03-04','WN',346,'N454WN','SAN','PDX','147','131',933,'1154',0,0),
('2015-03-04','HA',347,'N493HA','KOA','HNL','46','31',163,'1631',0,0),
('2015-03-04','WN',348,'N203WN','DAL','LAS','167','151',1067,'832',0,0),
('2015-03-04','HA',349,'N475HA','KOA','OGG','37','22',84,'1159',0,0),
('2015-03-04','B6',350,'N198JB','TPA','DCA','129','107',814,'928',0,0),
('2015-03-04','AA',351,'N3JWAA','DFW','IAH','69','45',224,'1605',0,0),
('2015-03-04','VX',352,'N846VA','SFO','BOS','326','305',2704,'1751',0,0),
('2015-03-04','B6',353,'N570JB','JFK','PBI','162','142',1028,'836',0,0),
('2015-03-05','B6',354,'N570JB','PBI','JFK','149','135',1028,'1204',0,0),
('2015-03-05','WN',355,'N261WN','SAN','LAS','66','53',258,'951',0,0),
('2015-03-05','UA',356,'N432UA','ALB','ORD','150','130',723,'840',0,0),
('2015-03-05','UA',357,'N465UA','IAH','IAD','158','136',1190,'1116',0,0),
('2015-03-05','WN',358,'N441WN','BWI','ISP','57','41',220,'1059',0,0),
('2015-03-05','WN',359,'N901WN','BDL','ATL','163','145',859,'1519',0,0),
('2015-03-05','UA',360,'N811UA','BZN','DEN','106','71',524,'901',0,0),
('2015-03-05','AA',361,'N3KTAA','EWR','MIA','189','158',1085,'1114',0,0),
('2015-03-05','B6',362,'N589JB','PBI','LGA','161','141',1035,'1457',0,0),
('2015-03-05','WN',363,'N718SW','BOI','OAK','89','68',511,'1019',0,0),
('2015-03-06','DL',364,'N547US','SEA','LAX','137','118',954,'929',0,0),
('2015-03-06','F9',365,'N218FR','MKE','DEN','142','120',896,'743',0,0),
('2015-03-06','B6',366,'N644JB','LGB','SMF','83','70',387,'818',0,0),
('2015-03-06','AA',367,'N494AA','TUL','DFW','','',237,'',0,1),
('2015-03-06','HA',368,'N480HA','HNL','KOA','46','29',163,'858',0,0),
('2015-03-06','WN',369,'N8312C','BWI','LAS','321','301',2106,'916',0,0),
('2015-03-06','AS',370,'N618AS','SEA','SMF','110','81',605,'1050',0,0),
('2015-03-06','AA',371,'N3GXAA','SEA','MIA','347','311',2724,'939',0,0),
('2015-03-06','WN',372,'N938WN','TPA','HOU','136','123',781,'919',0,0),
('2015-03-06','AS',373,'N618AS','SMF','SEA','109','88',605,'1313',0,0),
('2015-03-07','UA',374,'N415UA','OMA','ORD','79','57',416,'731',0,0),
('2015-03-07','AA',375,'N4WLAA','STL','DFW','111','90',550,'748',0,0),
('2015-03-07','AA',376,'N573AA','DFW','IND','130','90',761,'1054',0,0),
('2015-03-07','WN',377,'N928WN','DAL','LAX','199','179',1246,'1027',0,0),
('2015-03-07','AA',378,'N3BGAA','SJU','MIA','184','147',1045,'801',0,0),
('2015-03-07','NK',379,'N503NK','ACY','MYR','114','73',466,'815',0,0),
('2015-03-07','AS',380,'N760AS','PDX','SFO','108','83',550,'1153',0,0),
('2015-03-07','AS',381,'N760AS','SFO','PDX','96','81',550,'1427',0,0),
('2015-03-07','UA',382,'N438UA','ORD','IAD','95','76',589,'1122',0,0),
('2015-03-07','AS',383,'N622AS','SFO','PDX','104','83',550,'1044',0,0),
('2015-03-08','WN',384,'N785SW','CLT','MDW','129','103',584,'1004',0,0),
('2015-03-08','AA',385,'N403AA','BNA','DFW','118','105',631,'1015',0,0),
('2015-03-08','WN',386,'N8637A','MCI','LAS','176','161',1139,'851',0,0),
('2015-03-08','AA',387,'N4XXAA','LAX','AUS','','',1242,'',0,1),
('2015-03-08','WN',388,'N936WN','FLL','HOU','162','146',957,'934',0,0),
('2015-03-08','B6',389,'N281JB','BOS','DCA','92','74',399,'1014',0,0),
('2015-03-08','WN',390,'N283WN','MSP','MDW','76','58',349,'812',0,0),
('2015-03-08','B6',391,'N706JB','BOS','TPA','215','190',1185,'1520',0,0),
('2015-03-08','UA',392,'N456UA','PDX','SFO','98','78',550,'836',0,0),
('2015-03-08','WN',393,'N236WN','MSY','DEN','171','150',1062,'957',0,0),
('2015-03-09','B6',394,'N317JB','MCO','HPN','148','127',972,'932',0,0),
('2015-03-09','AA',395,'N3MCAA','ORD','SJU','241','223',2072,'2010',0,0),
('2015-03-09','HA',396,'N492HA','HNL','OGG','51','21',100,'1313',0,0),
('2015-03-09','AA',397,'N3CGAA','MIA','SJU','148','122',1045,'1249',0,0),
('2015-03-09','WN',398,'N475WN','TUL','DAL','61','48',237,'837',0,0),
('2015-03-09','VX',399,'N852VA','JFK','LAX','392','360',2475,'1027',0,0),
('2015-03-09','DL',400,'N381DN','PDX','JFK','288','268',2454,'1445',0,0),
('2015-03-09','US',401,'N732US','CLT','PHL','99','68',449,'802',0,0),
('2015-03-09','B6',402,'N307JB','FLL','JFK','206','168',1069,'2133',0,0),
('2015-03-09','US',403,'N660AW','DEN','PHX','109','91',602,'739',0,0),
('2015-03-10','VX',404,'N621VA','LAX','JFK','284','268',2475,'1512',0,0),
('2015-03-10','AS',405,'N565AS','SJC','PDX','105','88',569,'840',0,0),
('2015-03-10','AS',406,'N589AS','PDX','SJC','94','82',569,'729',0,0),
('2015-03-10','UA',407,'N845UA','IAH','BWI','156','139',1235,'1055',0,0),
('2015-03-10','US',408,'N521UW','PHL','PHX','351','327',2075,'1031',0,0),
('2015-03-10','NK',409,'N509NK','ORD','FLL','167','149',1182,'913',0,0),
('2015-03-10','US',410,'N765US','IAH','PHX','173','155',1009,'746',0,0),
('2015-03-10','WN',411,'N8614M','SAN','AUS','162','144',1164,'1307',0,0),
('2015-03-10','US',412,'N904AW','PHX','OGG','404','375',2845,'1231',0,0),
('2015-03-10','US',413,'N571UW','LAS','CLT','224','205',1916,'754',0,0),
('2015-03-11','WN',414,'N7815L','DAL','ATL','115','92',721,'1042',0,0),
('2015-03-11','UA',415,'N509UA','JFK','SFO','400','368',2586,'945',0,0),
('2015-03-11','UA',416,'N496UA','PDX','ORD','224','207',1739,'1156',0,0),
('2015-03-11','NK',417,'N587NK','DTW','FLL','167','150',1127,'930',0,0),
('2015-03-11','DL',418,'N706TW','SFO','JFK','307','284',2586,'1435',0,0),
('2015-03-11','UA',419,'N469UA','EWR','TPA','168','150',997,'1045',0,0),
('2015-03-11','DL',420,'N178DN','JFK','HNL','711','669',4983,'1537',0,0),
('2015-03-11','DL',421,'N967DL','JFK','ATL','139','117',760,'824',0,0),
('2015-03-11','UA',422,'N847UA','RNO','DEN','147','120',804,'924',0,0),
('2015-03-11','DL',423,'N713TW','JFK','LAX','391','364',2475,'1501',0,0),
('2015-03-12','US',424,'N161UW','ORD','PHX','240','212',1440,'958',0,0),
('2015-03-12','US',425,'N174US','PDX','PHX','150','132',1009,'950',0,0),
('2015-03-12','UA',426,'N848UA','IAH','LGA','188','167',1416,'1546',0,0),
('2015-03-12','B6',427,'N368JB','BOS','BWI','106','70',369,'952',0,0),
('2015-03-12','DL',428,'N995AT','JFK','TPA','173','150',1005,'1046',0,0),
('2015-03-12','F9',429,'N939FR','ATL','DEN','201','181',1199,'1036',0,0),
('2015-03-12','DL',430,'N624AG','JFK','SFO','390','357',2586,'1329',0,0),
('2015-03-12','UA',431,'N810UA','IAH','DCA','165','146',1208,'1359',0,0),
('2015-03-12','US',432,'N908AW','PHX','OGG','419','386',2845,'1535',0,0),
('2015-03-12','US',433,'N601AW','JFK','PHX','355','334',2153,'1023',0,0),
('2015-03-13','B6',434,'N637JB','SFO','BOS','323','304',2704,'1623',0,0),
('2015-03-13','WN',435,'N714CB','SAN','DAL','164','145',1182,'1153',0,0),
('2015-03-13','DL',436,'N703TW','JFK','SFO','364','344',2586,'2049',0,0),
('2015-03-13','US',437,'N585UW','SLC','PHX','96','71',507,'1555',0,0),
('2015-03-13','UA',438,'N465UA','LAX','ORD','223','198',1744,'2159',0,0),
('2015-03-13','F9',439,'N931FR','OMA','DEN','99','73',472,'648',0,0),
('2015-03-13','UA',440,'N496UA','PHL','IAH','248','220',1325,'2037',0,0),
('2015-03-13','UA',441,'N808UA','PIT','DEN','226','211',1290,'1813',0,0),
('2015-03-13','WN',442,'N759GS','DTW','LAS','261','243',1749,'921',0,0),
('2015-03-13','WN',443,'N628SW','PIT','MCO','130','114',834,'908',0,0),
('2015-03-14','UA',444,'N418UA','SFO','FLL','324','301',2583,'2228',0,0),
('2015-03-14','AS',445,'N579AS','LAX','SEA','160','139',954,'935',0,0),
('2015-03-14','US',446,'N651AW','MCI','PHX','179','159',1044,'743',0,0),
('2015-03-14','B6',447,'N527JB','OAK','LGB','78','60',353,'710',0,0),
('2015-03-14','WN',448,'N273WN','BWI','TPA','147','131',842,'1021',0,0),
('2015-03-14','UA',449,'N447UA','SAN','IAH','179','152',1303,'2201',0,0),
('2015-03-14','WN',450,'N611SW','ATL','FLL','104','87',581,'1010',0,0),
('2015-03-14','NK',451,'N633NK','PBG','FLL','191','174',1334,'450',0,0),
('2015-03-14','US',452,'N507AY','PHX','SAN','84','54',304,'901',0,0),
('2015-03-14','B6',453,'N652JB','JFK','PBI','164','143',1028,'939',0,0),
('2015-03-15','AS',454,'N442AS','SEA','LAX','150','122',954,'841',0,0),
('2015-03-15','US',455,'N651AW','PHX','SLC','96','74',507,'1008',0,0),
('2015-03-15','UA',456,'N830UA','DEN','LAX','149','111',862,'934',0,0),
('2015-03-15','US',457,'N585UW','DFW','PHX','169','143',868,'1011',0,0),
('2015-03-15','DL',458,'N3758Y','JFK','AUS','249','236',1521,'2051',0,0),
('2015-03-15','US',459,'N536UW','MCO','PHX','294','273',1849,'851',0,0),
('2015-03-15','US',460,'N640AW','SJC','PHX','110','85',621,'904',0,0),
('2015-03-15','US',461,'N540UW','ATL','CLT','63','38',226,'801',0,0),
('2015-03-15','B6',462,'N663JB','SJU','BOS','255','240',1674,'1629',0,0),
('2015-03-15','UA',463,'N482UA','LGA','ORD','156','136',733,'834',0,0),
('2015-03-16','UA',464,'N434UA','BOS','EWR','69','45',200,'801',0,0),
('2015-03-16','B6',465,'N828JB','BOS','RSW','216','198',1249,'1205',0,0),
('2015-03-16','AS',466,'N309AS','SEA','LAX','163','124',954,'939',0,0),
('2015-03-16','WN',467,'N404WN','LAX','HOU','191','181',1390,'1512',0,0),
('2015-03-16','NK',469,'N506NK','FLL','DFW','187','163',1119,'942',0,0),
('2015-03-16','NK',470,'N534NK','PDX','SAN','132','115',933,'828',0,0),
('2015-03-16','US',471,'N197UW','LAS','PHX','63','43',255,'1158',0,0),
('2015-03-16','DL',472,'N712TW','JFK','LAX','415','352',2475,'1203',0,0),
('2015-03-16','WN',473,'N423WN','BUF','FLL','192','158',1165,'1012',0,0),
('2015-03-16','WN',474,'N614SW','ONT','DEN','136','116',819,'925',0,0),
('2015-03-17','B6',475,'N599JB','PVD','MCO','204','155',1072,'953',0,0),
('2015-03-17','DL',476,'N196DN','LAX','JFK','308','274',2475,'1458',0,0),
('2015-03-17','AS',477,'N453AS','LAX','SEA','166','141',954,'841',0,0),
('2015-03-17','NK',478,'N528NK','FLL','ORD','196','176',1182,'947',0,0),
('2015-03-17','UA',479,'N476UA','SFO','LAX','97','53',337,'1027',0,0),
('2015-03-17','US',480,'N676AW','SEA','PHX','168','146',1107,'858',0,0),
('2015-03-17','AS',481,'N323AS','SAN','SEA','166','146',1050,'1245',0,0),
('2015-03-17','AS',482,'N433AS','SEA','LAX','143','126',954,'1025',0,0),
('2015-03-17','B6',483,'N705JB','JFK','MCO','176','145',944,'1239',0,0),
('2015-03-17','UA',484,'N809UA','SAN','DEN','147','120',853,'1138',0,0),
('2015-03-18','DL',485,'N910DE','JFK','ATL','138','117',760,'1043',0,0),
('2015-03-18','VX',486,'N629VA','LAX','LAS','64','45',236,'1707',0,0),
('2015-03-18','US',487,'N150UW','SAN','CLT','241','215',2077,'1817',0,0),
('2015-03-18','WN',488,'N269WN','DAL','MCO','136','125',973,'1119',0,0),
('2015-03-18','US',489,'N653AW','PHX','PIT','216','186',1814,'1531',0,0),
('2015-03-18','US',490,'N662AW','FLL','CLT','119','96',631,'1000',0,0),
('2015-03-18','UA',491,'N478UA','DEN','PHX','115','96',602,'1006',0,0),
('2015-03-18','WN',492,'N232WN','DTW','DEN','193','179',1123,'1057',0,0),
('2015-03-18','US',493,'N836AW','PIT','PHX','293','282',1814,'1002',0,0),
('2015-03-18','WN',494,'N738CB','LAS','SNA','54','38',226,'800',0,0),
('2015-03-19','UA',495,'N548UA','LAX','DEN','136','118',862,'906',0,0),
('2015-03-19','UA',496,'N436UA','SFO','PDX','102','84',550,'1023',0,0),
('2015-03-19','UA',497,'N476UA','SFO','SAN','88','69',447,'1502',0,0),
('2015-03-19','DL',498,'N702TW','JFK','SLC','329','302',1990,'1318',0,0),
('2015-03-19','AS',499,'N551AS','SAN','SEA','174','145',1050,'921',0,0),
('2015-03-19','UA',500,'N844UA','IND','SFO','274','253',1943,'930',0,0);
  
#Integrate Date Dimension table
#Modifies the number of columns from another source into this table
ALTER TABLE `flights`.`marflights`
ADD COLUMN `flight_date_key` int NOT NULL AFTER `DATE`;

UPDATE `flights`.`marflights` AS mf
JOIN `flights`.`dim_date` AS dd
ON DATE(mf.DATE) = dd.`full_date`
SET mf.`flight_date_key` = dd.`date_key`;