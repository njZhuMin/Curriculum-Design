create table adminer(
	adminer_id int primary key auto_increment,
	a_idcard varchar(60),
	a_pwd varchar(60),
	a_name varchar(60),
	a_style int);


create table client(
	c_id int  primary key  auto_increment,
	c_name varchar(60),
	c_s_name varchar(60),
	c_address varchar(60),
	c_tel varchar(60),
	c_p_name varchar(60),
	c_p_tel varchar(60),
	c_email varchar(60));

	
create table supplier(
	sup_id int primary key auto_increment,
	sup_name varchar(60),
	sup_s_name varchar(60),
	sup_address varchar(60),
	sup_encoding varchar(60),
	sup_tel varchar(60),
	sup_fax varchar(60),
	sup_people varchar(60),
	sup_p_tel varchar(60),
	sup_email varchar(60),
	sup_bank varchar(60));


create table product(
	p_id int primary key auto_increment,
	p_name varchar(60),
	p_s_name varchar(60),
	p_address varchar(60),
	p_num varchar(60),
	p_norms varchar(60),
	p_package varchar(60),
	p_unit varchar(60),
	p_pass_num varchar(60),
	p_single_money int,
	sup_id int,
	remark varchar(60));

	
create table storage(
	s_id int primary key auto_increment,
	p_id int,
	s_num int,
	s_adminer varchar(60));


create table orderline(
	o_id int primary key auto_increment,
	o_num_id varchar(60),
	p_id int,
	o_num int,
	o_all_money int,
	o_pay_money int,
	o_adminer_id varchar(60),
	o_date varchar(60),
	o_style int,
	o_pay_style int);	
	
	
	
	
	

	
INSERT INTO adminer (a_idcard,a_pwd ,a_name ,a_style )
VALUES ('','202CB962AC59075B964B07152D234B70', '123', 1);
INSERT INTO adminer (a_idcard,a_pwd ,a_name ,a_style )
VALUES ('','202CB962AC59075B964B07152D234B70', '2201', 1);
INSERT INTO adminer (a_idcard,a_pwd ,a_name ,a_style )
VALUES ('','202CB962AC59075B964B07152D234B70', '2202', 1);
INSERT INTO adminer (a_idcard,a_pwd ,a_name ,a_style )
VALUES ('','202CB962AC59075B964B07152D234B70', '2203', 1);
INSERT INTO adminer (a_idcard,a_pwd ,a_name ,a_style )
VALUES ('','202CB962AC59075B964B07152D234B70', '2204', 1);
INSERT INTO adminer (a_idcard,a_pwd ,a_name ,a_style )
VALUES ('','202CB962AC59075B964B07152D234B70', '2205', 1);




INSERT INTO supplier(sup_id,sup_name,sup_s_name,sup_address,sup_encoding,sup_tel,sup_fax,sup_people,sup_p_tel,sup_email,sup_bank)
VALUES('','上海波蜜有限公司','上海波蜜','上海市浦东新区湖南公路4588号','200120','886-4-3128078','886-4-23129469','zhou','13100000000','10484048@qq.com','中国银行');

INSERT INTO supplier(sup_id,sup_name,sup_s_name,sup_address,sup_encoding,sup_tel,sup_fax,sup_people,sup_p_tel,sup_email,sup_bank)
VALUES('','深圳市奥瑞斯有限公司','奥瑞斯集团','安徽','315400','132000000000','0574-62774308','zhou','13200000000','20484048@qq.com','中国农业银行');

INSERT INTO supplier(sup_id,sup_name,sup_s_name,sup_address,sup_encoding,sup_tel,sup_fax,sup_people,sup_p_tel,sup_email,sup_bank)
VALUES('','京都念慈庵总厂有限公司','进度念慈庵','香港','315400','133000000000','0574-62774308','zhou','13300000000','30484048@qq.com','浦发银行');

INSERT INTO supplier(sup_id,sup_name,sup_s_name,sup_address,sup_encoding,sup_tel,sup_fax,sup_people,sup_p_tel,sup_email,sup_bank)
VALUES('','南京富士高有限公司','富士高公司','南京江宁','315400','134000000000','0574-62774308','zhou','13400000000','40484048@qq.com','中国建设银行');

INSERT INTO supplier(sup_id,sup_name,sup_s_name,sup_address,sup_encoding,sup_tel,sup_fax,sup_people,sup_p_tel,sup_email,sup_bank)
VALUES('','漳州片仔癀药业股份有限公司','片仔癀','漳州','315400','135000000000','0574-62774308','zhou','13500000000','50484048@qq.com','中国交通银行');





INSERT INTO client (c_id, c_name, c_s_name, c_address, c_tel, c_p_name, c_p_tel, c_email)
VALUES ('','南京师范大学','南师大', '南京市栖霞区文苑路1号','1234556','liming','34278','aa@qq.com');





INSERT INTO product (p_name,p_s_name ,p_address ,p_num,p_norms,p_package,p_unit,p_pass_num,p_single_money,sup_id,remark )
VALUES ('氨','NH3', '1-1', '10','PC-TWA 20mg/m^3','液氨储罐','吨','10','2450','001','无');

INSERT INTO product (p_name,p_s_name ,p_address ,p_num,p_norms,p_package,p_unit,p_pass_num,p_single_money,sup_id,remark )
VALUES ('白磷','P4','1-2','10','PC-TWA 0.05mg/m^3','冷库','吨','10','17800','001','无');

INSERT INTO product (p_name,p_s_name ,p_address ,p_num,p_norms,p_package,p_unit,p_pass_num,p_single_money,sup_id,remark )
VALUES ('苯','C6H6','1-3','5','PC-TWA 6mg/m^3(皮)','苯罐','吨','5','6000','001','无');





INSERT INTO orderline(o_num_id,p_id,o_num,o_all_money ,o_pay_money ,o_adminer_id,o_date,o_style,o_pay_style)
VALUES('',00000001,'',100,100,'2201','2015/11/27',140,1);

INSERT INTO orderline(o_num_id,p_id,o_num,o_all_money ,o_pay_money ,o_adminer_id,o_date,o_style,o_pay_style)
VALUES('',00000002,'',200,200,'2202','2015/11/28',153,2);

INSERT INTO orderline(o_num_id,p_id,o_num,o_all_money ,o_pay_money ,o_adminer_id,o_date,o_style,o_pay_style)
VALUES('',00000003,'',300,300,'2203','2015/11/29',212,1);

INSERT INTO orderline(o_num_id,p_id,o_num,o_all_money ,o_pay_money ,o_adminer_id,o_date,o_style,o_pay_style)
VALUES('',00000004,'',400,400,'2204','2015/11/30',130,2);





INSERT INTO storage(p_id ,s_num ,s_adminer) VALUES (00000001,100, '张三');

INSERT INTO storage(p_id ,s_num ,s_adminer) VALUES (00000002,180, '李四'); 

INSERT INTO storage(p_id ,s_num ,s_adminer) VALUES (00000003,170, '王五'); 

INSERT INTO storage(p_id ,s_num ,s_adminer) VALUES (00000004,130, '赵六'); 

