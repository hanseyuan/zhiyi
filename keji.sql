SET  NAMES  UTF8;
DROP DATABASE IF EXISTS keji;
CREATE DATABASE keji CHARSET=UTF8;
USE keji;
# 1.1.用户信息表（kj_user）
CREATE TABLE kj_user(
  uid INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  uname   VARCHAR(32),
  upwd    VARCHAR(32),
  avatar  VARCHAR(128),
  company_name   VARCHAR(64),
  company_phone   VARCHAR(64),
  company_address VARCHAR(64),
  company_post  VARCHAR(64)
);
INSERT INTO kj_user VALUES ('1', 'huahua', '123456','img/avatar/default.png', "淘宝", '13511011000', "幸福大街5号", '510000');
INSERT INTO kj_user VALUES ('2', 'lingding', '123456','img/avatar/default.png', '京东', '13412201100', '幸福大街6号', '510000');
INSERT INTO kj_user VALUES ('3', 'dawei', '123456','img/avatar/default.png', '锤子', '13701100077', '北大街', '510000');
INSERT INTO kj_user VALUES ('4', 'liukai', '123456','img/avatar/default.png', '小米', '13685511000', '长安大街', '510000');
INSERT INTO kj_user VALUES ('5', 'fangfang', '123456','img/avatar/default.png', '华为', '13517157700', '幸福大街', '510000');
INSERT INTO kj_user VALUES ('6', 'dingding', '123456','img/avatar/default.png', '淘宝', '13574511000', '幸福大街', '510000');

#1.2.	用户地址表 （kj_receiver_address）
CREATE TABLE kj_receiver_address(
   aid	INT PRIMARY KEY AUTO_INCREMENT ,
   user_id 	INT,
   FOREIGN KEY  (user_id) REFERENCES kj_user(uid),
   receiver	VARCHAR(16), 
   province 	VARCHAR(16), 
   city         VARCHAR(16),        
   county	VARCHAR(16),
   address 	VARCHAR(128),      
   cellphone 	VARCHAR(16),
   fixedphone 	VARCHAR(16),
   postcode 	CHAR(6),
   tag 	        VARCHAR(16),
   is_default 	BOOLEAN          
);

#1.4	用户订单表 （kj_order）
CREATE TABLE kj_order(
  aid 	INT 	PRIMARY KEY AUTO_INCREMENT,
  user_id 	INT,	
  FOREIGN KEY  (user_id) REFERENCES kj_user(uid),
  address_id 	INT,	
  FOREIGN KEY  (address_id) REFERENCES kj_receiver_address(aid),
  status 	INT,             	
  order_time 	BIGINT,        
  pay_time 	BIGINT,        
  deliver_time 	BIGINT,    
  received_time BIGINT    
);


#1.6.	商品类别表 （kj_family）
CREATE TABLE  kj_family(
  fid 	INT 	PRIMARY KEY AUTO_INCREMENT,
  name 	VARCHAR(32)	
);
INSERT INTO kj_family VALUES ('1', "智能手表");
INSERT INTO kj_family VALUES ('2', "智能眼镜");
INSERT INTO kj_family VALUES ('3', "机器人");
INSERT INTO kj_family VALUES ('4', "体感车");
INSERT INTO kj_family VALUES ('5', "无人机");


# 1.4.7.商品表 （kj_commodity）
CREATE TABLE kj_commodity(
  lid 	INT 	PRIMARY KEY AUTO_INCREMENT,
  family_id  	INT,
  FOREIGN KEY  (family_id)  REFERENCES kj_family(fid),
  title 	VARCHAR(128),	
  price 	DECIMAL(10,2),
  color  	VARCHAR(64),           
  size	        VARCHAR(32),           
  people	VARCHAR(64),
  weight 	VARCHAR(32),         
  origin	VARCHAR(32),  
   os 	        VARCHAR(32),             
  function	VARCHAR(32),         
  package 	VARCHAR(32), 
  is_onsale 	BOOLEAN ,          
  details 	VARCHAR(1024)      
);
INSERT INTO `kj_commodity` VALUES ('1', '1', 'Apple Watch Sport', '2288.00', '黑色',     '38毫米', '儿童，成年人，老年人','255g','中国大陆','Android，IOS', '功能','包装', '1', '<div><img src="img/product/detail/1463968457167910.jpg" ><img src="img/product/detail/1463968457105651.jpg"> </div>');
INSERT INTO `kj_commodity` VALUES ('2', '1', 'Apple Watch Sport', '2288.00', '白色',     '38毫米', '儿童，成年人，老年人','255g','中国大陆','Android，IOS', '功能','包装', '1','<div><img src="img/product/detail/1463968457167910.jpg" ><img src="img/product/detail/1463968457105651.jpg"> </div>');
INSERT INTO `kj_commodity` VALUES ('3', '1', 'Apple Watch Sport', '2288.00', '宝石蓝色', '38毫米', '儿童，成年人，老年人','255g','中国大陆','Android，IOS', '','', '0','');
INSERT INTO `kj_commodity` VALUES ('4', '1', 'Apple Watch Sport', '2288.00', '橙色',     '38毫米', '儿童，成年人，老年人','255g','中国大陆','Android，IOS', '','', '0','');
INSERT INTO `kj_commodity` VALUES ('5', '1', 'Apple Watch Sport', '2288.00', '黄色',     '38毫米', '儿童，成年人，老年人','255g','中国大陆','Android，IOS', '','', '0','');
INSERT INTO `kj_commodity` VALUES ('6', '1', 'Apple Watch Sport', '2288.00', '黑色',     '42毫米', '儿童，成年人，老年人','255g','中国大陆','Android，IOS', '','', '0','');
INSERT INTO `kj_commodity` VALUES ('7', '1', 'Apple Watch Sport', '2288.00', '白色',     '42毫米', '儿童，成年人，老年人','255g','中国大陆','Android，IOS', '','', '0','');
INSERT INTO `kj_commodity` VALUES ('8', '1', 'Apple Watch Sport', '2288.00', '宝石蓝色', '42毫米', '儿童，成年人，老年人','255g','中国大陆','Android，IOS', '','', '0','');
INSERT INTO `kj_commodity` VALUES ('9', '1', 'Apple Watch Sport', '2288.00', '橙色',     '42毫米', '儿童，成年人，老年人','255g','中国大陆','Android，IOS', '','', '0','');
INSERT INTO `kj_commodity` VALUES ('10', '1', 'Apple Watch Sport', '2288.00', '黄色',    '42毫米', '儿童，成年人，老年人','255g','中国大陆','Android，IOS', '','', '0','');

#1.4.3.	用户购物车表（kj_shopping_cart）
CREATE TABLE kj_shopping_cart(
    cid 	INT 	PRIMARY KEY AUTO_INCREMENT,
    user_id 	INT , 	
    FOREIGN KEY  (user_id) REFERENCES kj_user(uid),
    product_id 	INT ,
    FOREIGN KEY (  product_id ) REFERENCES  kj_commodity(lid),
    count	INT 
);
#1.4.5.	用户订单详情表 （kj_order_detail）
CREATE TABLE kj_order_detail(
  did 	        INT PRIMARY KEY AUTO_INCREMENT,
  order_id 	INT,
  FOREIGN KEY  (order_id)  REFERENCES kj_order(user_id),
  product_id  	INT,
  FOREIGN KEY ( product_id ) REFERENCES  kj_commodity(lid),
  count         INT             	
); 


#1.4.8.	商品详情图表 （kj_commodity_pic）
CREATE TABLE kj_commodity_pic(
   pid 	INT 	PRIMARY KEY AUTO_INCREMENT,
   product_id	INT,
   FOREIGN KEY (  product_id ) REFERENCES kj_commodity(lid),
   sm 	        VARCHAR(128),            	
   md           VARCHAR(128),            	
   lg 	        VARCHAR(128)             	
);
INSERT INTO `kj_commodity_pic` VALUES ('1', '1', 'img/product/md/1463968649.jpg', 'img/product/md/1463968649.jpg', 'img/product/md/1463968649.jpg');
INSERT INTO `kj_commodity_pic` VALUES ('2', '1', 'img/product/md/1463968683.jpg', 'img/product/md/1463968683.jpg', 'img/product/md/1463968683.jpg');
INSERT INTO `kj_commodity_pic` VALUES ('3', '1', 'img/product/md/1463970224.jpg', 'img/product/md/1463970224.jpg', 'img/product/md/1463970224.jpg');
INSERT INTO `kj_commodity_pic` VALUES ('4', '1', 'img/product/md/1463970070.jpg', 'img/product/md/1463970070.jpg', 'img/product/md/1463970070.jpg');
INSERT INTO `kj_commodity_pic` VALUES ('5', '1', 'img/product/md/1463970452.jpg', 'img/product/md/1463970452.jpg', 'img/product/md/1463970452.jpg');
INSERT INTO `kj_commodity_pic` VALUES ('6', '1', 'img/product/md/1463969986.jpg', 'img/product/md/1463969986.jpg', 'iimg/product/md/1463969986.jpg');


#1.4.9.	首页轮播图表 （kj_index_carousel）
CREATE TABLE kj_index_carousel(
    cid 	INT 	PRIMARY KEY AUTO_INCREMENT,
    img	        VARCHAR(128),	
    title 	VARCHAR(64),            	
    href 	VARCHAR(128)            	
);