DROP schema if exists`proietto` ;
CREATE SCHEMA IF NOT EXISTS `proietto` ;
USE `proietto` ;

CREATE TABLE `proietto`.`user` (
                                               `id_user` BIGINT NOT NULL AUTO_INCREMENT,
                                               `credit` DOUBLE NULL DEFAULT 0.0,
                                               `username` VARCHAR(255) NULL,
                                               `password` VARCHAR(255) NULL,
                                               `email` VARCHAR(255) NULL,
                                               `name` VARCHAR(255) NULL,
                                               `mobile` VARCHAR(255) NULL,
                                               `active` BIGINT NOT NULL DEFAULT 0,
                                               `role` VARCHAR(255) NULL DEFAULT 'user',
                                               PRIMARY KEY (`id_user`))ENGINE=InnoDB AUTO_INCREMENT=100,
    COMMENT = 'UTENTE';


CREATE TABLE `proietto`.`product` (
                                                  `id_product` BIGINT NOT NULL AUTO_INCREMENT,
                                                  `price` DOUBLE NULL,
                                                  `description` VARCHAR(255) NULL,
                                                  `image` VARCHAR(255) NULL,
                                                  `cup` TINYINT(1) NULL DEFAULT 0,
                                                  PRIMARY KEY (`id_product`))
    COMMENT = 'PRODOTTO';


CREATE TABLE `proietto`.`machine` (
                                                  `id_vending_machine` BIGINT NOT NULL AUTO_INCREMENT,
                                                  `state` VARCHAR(45) NULL DEFAULT 'ready',
                                                  `position` VARCHAR(255) NULL,
                                                  `balance` DOUBLE NULL DEFAULT 0.0,
                                                  `working` TINYINT NULL DEFAULT 0,
                                                  PRIMARY KEY (`id_vending_machine`))ENGINE=InnoDB AUTO_INCREMENT=1000,
    COMMENT = 'VENDING MACHINE';

INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (100,10,'giuseppeverdi','password','giuseppeverdi@gmail.com','Giuseppe Verdi','333123456',0,'USER');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (101,10,'mariorossi','password','mariorossi@gmail.com','Mario Rossi','333123452',0,'SERVICE');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (102,10,'giuliabianchi','password','giuliabianchi@gmail.com','Giulia Bianchi','333123453',0,'ADMINISTRATOR');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (103,10,'marcoazzurri','password','marcoazzurri@gmail.com','Marco Azzurri','333123456',0,'USER');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (104,10,'elisaviola','password','elisaviola@gmail.com','Elisa Viola','333123452',0,'USER');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (105,10,'mariarosa','password','mariarosa@gmail.com','Maria Rosa','333123453',0,'ADMINISTRATOR');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (106,10,'francesconero','password','francesconero@gmail.com','Francesco Nero','333123456',0,'USER');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (107,10,'giovanniarancio','password','giovanniarancio@gmail.com','Giovanni Arancio','333123452',0,'SERVICE');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (108,10,'davideproietto','password','davideproietto@gmail.com','Davide Proietto','3337215555',0,'USER');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (109,10,'giuseppeconte','password','giuseppeconte@gmail.com','Giuseppe Conte','333123452',0,'USER');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (110,10,'matteosalvini','password','matteosalvini@gmail.com','Matteo Salvini','333123333',0,'USER');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (111,10,'giorgiameloni','password','giorgiameloni@gmail.com','Giorgia Meloni','333144356',0,'ADMINISTRATOR');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (112,10,'silvioberlusconi','password','silvioberlusconi@gmail.com','Silvio Berlusconi','3331441452',0,'SERVICE');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (113,10,'enricoletta','password','enricoletta@gmail.com','Enrico Letta','3337255555',0,'USER');
INSERT INTO `user` (`id_user`,`credit`,`username`,`password`,`email`,`name`,`mobile`,`active`,`role`) VALUES (114,10,'matteorenzi','password','matteorenzi@gmail.com','Matteo Renzi','3337243555',0,'USER');



INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (1,1,'CocaCola Zero','public/img/coca-cola.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (2,1,'Fanta','public/img/fanta.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (3,1,'Sprite','public/img/sprite.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (4,1.5,'Pino Grigio','public/img/pino.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (5,0.6,'Caffe Borbone','public/img/borbone.jpg',1);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (6,0.7,'Caffe Lavazza','public/img/lavazza.png',1);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (7,0.6,'Latte','public/img/latte.jpg',1);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (8,0.6,'Irish Coffe','public/img/irish.png',1);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (9,0.8,'M M','public/img/mm.jpg',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (10,0.8,'Donut','public/img/donut.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (11,1,'Tuc','public/img/tuc.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (12,0.5,'Acqua','public/img/lete.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (13,1,'Fonzie','public/img/fonzie.jpg',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (14,1.2,'Pringles','public/img/pringles.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (15,1,'Patatine','public/img/lays.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (16,1,'Tramezzino','public/img/tram.jpg',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (17,0.6,'Cioccolata','public/img/cioccolato.jpg',1);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (18,0.6,'Thè Caldo','public/img/thecaldo.jpg',1);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (19,1.5,'Milk Shake','public/img/milkshake.jpg',1);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (20,1.2,'Yogurt','public/img/yogurt.png',1);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (21,1,'Fanta Lemon','public/img/flemon.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (22,1,'Kinder Bueno','public/img/bueno.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (23,1,'Frisk','public/img/frisk.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (24,1.2,'Estate','public/img/estathe.png',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (25,1.5,'Smarties','public/img/smarties.jpg',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (26,0.9,'Biscottone vaniglia','public/img/biscotto.jpg',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (27,1,'Condoms','public/img/condom.jpg',0);
INSERT INTO `product` (`id_product`,`price`,`description`,`image`,`cup`) VALUES (28,0.9,'Biscottone','public/img/coockie.png',0);




INSERT INTO `machine` (`id_vending_machine`,`state`,`position`,`balance`,`working`) VALUES (1000,'0','50,41 30,41',0,1);
INSERT INTO `machine` (`id_vending_machine`,`state`,`position`,`balance`,`working`) VALUES (1001,'0','51,41 31,41',0,1);
INSERT INTO `machine` (`id_vending_machine`,`state`,`position`,`balance`,`working`) VALUES (1002,'0','52,41 32,41',0,1);
INSERT INTO `machine` (`id_vending_machine`,`state`,`position`,`balance`,`working`) VALUES (1003,'0','53,41 30,41',0,1);
INSERT INTO `machine` (`id_vending_machine`,`state`,`position`,`balance`,`working`) VALUES (1004,'0','54,41 31,41',0,1);
INSERT INTO `machine` (`id_vending_machine`,`state`,`position`,`balance`,`working`) VALUES (1005,'0','55,41 32,41',0,0);
INSERT INTO `machine` (`id_vending_machine`,`state`,`position`,`balance`,`working`) VALUES (1006,'0','56,41 30,41',0,0);
INSERT INTO `machine` (`id_vending_machine`,`state`,`position`,`balance`,`working`) VALUES (1007,'0','57,41 31,41',0,0);
INSERT INTO `machine` (`id_vending_machine`,`state`,`position`,`balance`,`working`) VALUES (1008,'0','58,41 32,41',0,0);


CREATE TABLE `proietto`.`contains` (
                                                   `id_contains` BIGINT NOT NULL AUTO_INCREMENT,
                                                   `ref_machine` BIGINT NOT NULL,
                                                   `ref_product` BIGINT NOT NULL,
                                                   `qty` INT NULL,
                                                   `qty_stock` INT NULL,
                                                   `slot` VARCHAR(45) NULL,
                                                   PRIMARY KEY (`id_contains`))
    COMMENT = 'slave product-machine';


CREATE TABLE `proietto`.`buying` (
                                                 `id_buying` BIGINT NOT NULL AUTO_INCREMENT,
                                                 `cod_user` BIGINT NOT NULL,
                                                 `cod_product` BIGINT NOT NULL,
                                                 `date` DATETIME NULL,
                                                 `transaction` VARCHAR(255) NULL,
                                                 `complete` TINYINT(1) NULL,
                                                 PRIMARY KEY (`id_buying`))
    COMMENT = 'slave user-product';


ALTER TABLE `proietto`.`contains`
    ADD INDEX `FK_idx` (`ref_machine` ASC) VISIBLE;
;
ALTER TABLE `proietto`.`contains`
    ADD CONSTRAINT `FK Machine`
        FOREIGN KEY (`ref_machine`)
            REFERENCES `proietto`.`machine` (`id_vending_machine`)
            ON DELETE CASCADE
            ON UPDATE CASCADE;


ALTER TABLE `proietto`.`contains`
    ADD INDEX `FK Product_idx` (`ref_product` ASC) VISIBLE;
;
ALTER TABLE `proietto`.`contains`
    ADD CONSTRAINT `FK Product`
        FOREIGN KEY (`ref_product`)
            REFERENCES `proietto`.`product` (`id_product`)
            ON DELETE CASCADE
            ON UPDATE CASCADE;


INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (1,1000,1,10,1,'01');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (2,1000,2,10,1,'02');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (3,1000,3,10,2,'03');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (4,1000,4,10,10,'04');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (5,1000,5,10,10,'05');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (6,1000,6,10,10,'06');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (7,1000,7,10,10,'07');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (8,1000,8,10,10,'08');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (9,1000,9,10,10,'09');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (10,1000,10,10,10,'10');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (11,1000,11,10,10,'11');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (12,1000,12,10,10,'12');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (13,1000,13,10,10,'13');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (14,1000,14,10,10,'14');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (15,1000,15,10,10,'15');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (16,1000,16,10,10,'16');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (17,1000,17,10,10,'17');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (18,1000,18,10,10,'18');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (19,1000,19,10,10,'19');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (20,1000,20,10,10,'20');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (21,1000,21,10,10,'21');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (22,1000,22,10,10,'22');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (23,1000,23,10,10,'23');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (24,1000,24,10,10,'24');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (25,1000,25,10,10,'25');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (26,1000,26,10,10,'26');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (27,1000,27,10,10,'27');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (28,1000,28,10,10,'28');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (29,1000,25,10,10,'29');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (30,1000,25,10,10,'30');

INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (31,1001,1,10,10,'01');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (32,1001,2,10,10,'02');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (33,1001,3,10,10,'03');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (34,1001,4,10,10,'04');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (35,1001,5,10,10,'05');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (36,1001,6,10,10,'06');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (37,1001,7,10,10,'07');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (38,1001,8,10,10,'08');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (39,1001,9,10,10,'09');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (40,1001,10,10,10,'10');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (41,1001,11,10,10,'11');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (42,1001,12,10,10,'12');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (43,1001,13,10,10,'13');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (44,1001,14,10,10,'14');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (45,1001,15,10,10,'15');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (46,1001,16,10,10,'16');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (47,1001,17,10,10,'17');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (48,1001,18,10,10,'18');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (49,1001,19,10,10,'19');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (50,1001,20,10,10,'20');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (51,1001,21,10,10,'21');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (52,1001,22,10,10,'22');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (53,1001,23,10,10,'23');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (54,1001,24,10,10,'24');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (55,1001,25,10,10,'25');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (56,1001,26,10,10,'26');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (57,1001,27,10,10,'27');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (58,1001,28,10,10,'28');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (59,1001,25,10,10,'29');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (60,1001,25,10,10,'30');

INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (61,1002,1,10,10,'01');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (62,1002,2,10,10,'02');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (63,1002,3,10,10,'03');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (64,1002,4,10,10,'04');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (65,1002,5,10,10,'05');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (66,1002,6,10,10,'06');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (67,1002,7,10,10,'07');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (68,1002,8,10,10,'08');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (69,1002,9,10,10,'09');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (70,1002,10,10,10,'10');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (71,1002,11,10,10,'11');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (72,1002,12,10,10,'12');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (73,1002,13,10,10,'13');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (74,1002,14,10,10,'14');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (75,1002,15,10,10,'15');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (76,1002,16,10,10,'16');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (77,1002,17,10,10,'17');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (78,1002,18,10,10,'18');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (79,1002,19,10,10,'19');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (80,1002,20,10,10,'20');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (81,1002,21,10,10,'21');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (82,1002,22,10,10,'22');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (83,1002,23,10,10,'23');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (84,1002,24,10,10,'24');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (85,1002,25,10,10,'25');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (86,1002,26,10,10,'26');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (87,1002,27,10,10,'27');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (88,1002,28,10,10,'28');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (89,1002,25,10,10,'29');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (90,1002,25,10,10,'30');

INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (91,1003,1,10,10,'01');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (92,1003,2,10,10,'02');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (93,1003,3,10,10,'03');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (94,1003,4,10,10,'04');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (95,1003,5,10,10,'05');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (96,1003,6,10,10,'06');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (97,1003,7,10,10,'07');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (98,1003,8,10,10,'08');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (99,1003,9,10,10,'09');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (100,1003,10,10,10,'10');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (101,1003,11,10,10,'11');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (102,1003,12,10,10,'12');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (103,1003,13,10,10,'13');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (104,1003,14,10,10,'14');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (105,1003,15,10,10,'15');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (106,1003,16,10,10,'16');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (107,1003,17,10,10,'17');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (108,1003,18,10,10,'18');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (109,1003,19,10,10,'19');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (110,1003,20,10,10,'20');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (111,1003,21,10,10,'21');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (112,1003,22,10,10,'22');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (113,1003,23,10,10,'23');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (114,1003,24,10,10,'24');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (115,1003,25,10,10,'25');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (116,1003,26,10,10,'26');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (117,1003,27,10,10,'27');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (118,1003,28,10,10,'28');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (119,1003,25,10,10,'29');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (120,1003,25,10,10,'30');

INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (121,1004,1,10,10,'01');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (122,1004,2,10,10,'02');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (123,1004,3,10,10,'03');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (124,1004,4,10,10,'04');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (125,1004,5,10,10,'05');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (126,1004,6,10,10,'06');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (127,1004,7,10,10,'07');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (128,1004,8,10,10,'08');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (129,1004,9,10,10,'09');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (130,1004,10,10,10,'10');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (131,1004,11,10,10,'11');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (132,1004,12,10,10,'12');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (133,1004,13,10,10,'13');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (134,1004,14,10,10,'14');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (135,1004,15,10,10,'15');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (136,1004,16,10,10,'16');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (137,1004,17,10,10,'17');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (138,1004,18,10,10,'18');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (139,1004,19,10,10,'19');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (140,1004,20,10,10,'20');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (141,1004,21,10,10,'21');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (142,1004,22,10,10,'22');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (143,1004,23,10,10,'23');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (144,1004,24,10,10,'24');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (145,1004,25,10,10,'25');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (146,1004,26,10,10,'26');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (147,1004,27,10,10,'27');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (148,1004,28,10,10,'28');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (149,1004,25,10,10,'29');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (150,1004,25,10,10,'30');

INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (161,1008,1,10,10,'01');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (162,1008,2,10,10,'02');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (163,1008,3,10,10,'03');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (164,1008,4,10,10,'04');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (165,1008,5,10,10,'05');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (166,1008,6,10,10,'06');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (167,1008,7,10,10,'07');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (168,1008,8,10,10,'08');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (169,1008,9,10,10,'09');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (170,1008,10,10,10,'10');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (171,1008,11,10,10,'11');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (172,1008,12,10,10,'12');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (173,1008,13,10,10,'13');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (174,1008,14,10,10,'14');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (175,1008,15,10,10,'15');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (176,1008,16,10,10,'16');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (177,1008,17,10,10,'17');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (178,1008,18,10,10,'18');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (179,1008,19,10,10,'19');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (180,1008,20,10,10,'20');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (181,1008,21,10,10,'21');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (182,1008,22,10,10,'22');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (183,1008,23,10,10,'23');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (184,1008,24,10,10,'24');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (185,1008,25,10,10,'25');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (186,1008,26,10,10,'26');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (187,1008,27,10,10,'27');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (188,1008,28,10,10,'28');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (189,1008,25,10,10,'29');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (190,1008,25,10,10,'30');

INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (201,1005,1,10,10,'01');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (202,1005,2,10,10,'02');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (203,1005,3,10,10,'03');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (204,1005,4,10,10,'04');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (205,1005,5,10,10,'05');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (206,1005,6,10,10,'06');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (207,1005,7,10,10,'07');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (208,1005,8,10,10,'08');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (209,1005,9,10,10,'09');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (210,1005,10,10,10,'10');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (211,1005,11,10,10,'11');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (212,1005,12,10,10,'12');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (213,1005,13,10,10,'13');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (214,1005,14,10,10,'14');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (215,1005,15,10,10,'15');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (216,1005,16,10,10,'16');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (217,1005,17,10,10,'17');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (218,1005,18,10,10,'18');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (219,1005,19,10,10,'19');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (220,1005,20,10,10,'20');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (221,1005,21,10,10,'21');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (222,1005,22,10,10,'22');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (223,1005,23,10,10,'23');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (224,1005,24,10,10,'24');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (225,1005,25,10,10,'25');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (226,1005,26,10,10,'26');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (227,1005,27,10,10,'27');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (228,1005,28,10,10,'28');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (229,1005,25,10,10,'29');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (230,1005,25,10,10,'30');

INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (231,1006,1,10,10,'01');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (232,1006,2,10,10,'02');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (233,1006,3,10,10,'03');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (234,1006,4,10,10,'04');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (235,1006,5,10,10,'05');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (236,1006,6,10,10,'06');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (237,1006,7,10,10,'07');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (238,1006,8,10,10,'08');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (239,1006,9,10,10,'09');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (240,1006,10,10,10,'10');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (241,1006,11,10,10,'11');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (242,1006,12,10,10,'12');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (243,1006,13,10,10,'13');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (244,1006,14,10,10,'14');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (245,1006,15,10,10,'15');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (246,1006,16,10,10,'16');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (247,1006,17,10,10,'17');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (248,1006,18,10,10,'18');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (249,1006,19,10,10,'19');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (250,1006,20,10,10,'20');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (251,1006,21,10,10,'21');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (252,1006,22,10,10,'22');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (253,1006,23,10,10,'23');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (254,1006,24,10,10,'24');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (255,1006,25,10,10,'25');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (256,1006,26,10,10,'26');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (257,1006,27,10,10,'27');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (258,1006,28,10,10,'28');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (259,1006,25,10,10,'29');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (260,1006,25,10,10,'30');

INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (261,1007,1,10,10,'01');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (262,1007,2,10,10,'02');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (263,1007,3,10,10,'03');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (264,1007,4,10,10,'04');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (265,1007,5,10,10,'05');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (266,1007,6,10,10,'06');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (267,1007,7,10,10,'07');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (268,1007,8,10,10,'08');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (269,1007,9,10,10,'09');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (270,1007,10,10,10,'10');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (271,1007,11,10,10,'11');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (272,1007,12,10,10,'12');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (273,1007,13,10,10,'13');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (274,1007,14,10,10,'14');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (275,1007,15,10,10,'15');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (276,1007,16,10,10,'16');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (277,1007,17,10,10,'17');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (278,1007,18,10,10,'18');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (279,1007,19,10,10,'19');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (280,1007,20,10,10,'20');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (281,1007,21,10,10,'21');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (282,1007,22,10,10,'22');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (283,1007,23,10,10,'23');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (284,1007,24,10,10,'24');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (285,1007,25,10,10,'25');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (286,1007,26,10,10,'26');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (287,1007,27,10,10,'27');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (288,1007,28,10,10,'28');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (289,1007,25,10,10,'29');
INSERT INTO `contains` (`id_contains`,`ref_machine`,`ref_product`,`qty`,`qty_stock`,`slot`) VALUES (290,1007,25,10,10,'30');


ALTER TABLE `proietto`.`buying`
    ADD INDEX `FK_buy_idx` (`cod_user` ASC) VISIBLE;
;
ALTER TABLE `proietto`.`buying`
    ADD CONSTRAINT `FK_buy`
        FOREIGN KEY (`cod_user`)
            REFERENCES `proietto`.`user` (`id_user`)
            ON DELETE CASCADE
            ON UPDATE CASCADE;

ALTER TABLE `proietto`.`buying`
    ADD INDEX `FK_product_idx` (`cod_product` ASC) VISIBLE;
;
ALTER TABLE `proietto`.`buying`
    ADD CONSTRAINT `FK_product`
        FOREIGN KEY (`cod_product`)
            REFERENCES `proietto`.`product` (`id_product`)
            ON DELETE CASCADE
            ON UPDATE CASCADE;
