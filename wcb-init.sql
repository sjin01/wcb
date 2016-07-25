/*==============================================================*/
/* dbms name:      mysql 5.0                                    */
/* created on:     2016/7/16 17:16:16                           */
/*==============================================================*/


drop table if exists t_account;

drop table if exists t_account_equipment;

drop table if exists t_community;

drop table if exists t_district;

drop table if exists t_district_user;

drop table if exists t_equipment;

drop table if exists t_record_pay;

drop table if exists t_record_survey;

drop table if exists t_sys_dict;

drop table if exists t_sys_func;

drop table if exists t_sys_role;

drop table if exists t_sys_role_func;

drop table if exists t_sys_user;

drop table if exists t_sys_user_group;

drop table if exists t_sys_user_role;

/*==============================================================*/
/* table: t_account                                             */
/*==============================================================*/
create table t_account
(
   id                   int(11) not null auto_increment,
   code                 varchar(32),
   name                 varchar(32),
   addr                 varchar(512),
   province             int(11),
   city                 int(11),
   area                 int(11),
   street               int(11),
   community            int(11),
   communityname        varchar(512),
   ridgepole            varchar(64),
   household            varchar(64),
   peoplenumber         int(11),
   card                 varchar(512),
   distid               int(11),
   primary key (id)
);

alter table t_account comment '业主用户';

/*==============================================================*/
/* table: t_account_equipment                                   */
/*==============================================================*/
create table t_account_equipment
(
   id                   int(11) not null auto_increment,
   accountid            int(11),
   equipmentid          int(11),
   createdate           datetime,
   invaliddate          datetime comment '就是作废时间',
   status               tinyint(1) comment '1当前启用；0作废',
   primary key (id)
);

alter table t_account_equipment comment '中间关系表';

/*==============================================================*/
/* table: t_community                                           */
/*==============================================================*/
create table t_community
(
   id                   int(11) not null auto_increment,
   name                 varchar(512),
   province             int(11),
   city                 int(11),
   area                 int(11),
   street               int(11),
   primary key (id)
);

alter table t_community comment '小区';

/*==============================================================*/
/* table: t_district                                            */
/*==============================================================*/
create table t_district
(
   id                   int(11) not null auto_increment,
   name                 varchar(64) comment '比如：某某小区',
   remark               varchar(512) comment '比如：12栋',
   primary key (id)
);

alter table t_district comment '操作员对用户应分成片区来管理 可以想象成:水表用户组';

/*==============================================================*/
/* table: t_district_user                                       */
/*==============================================================*/
create table t_district_user
(
   id                   int(11) not null auto_increment,
   userid               int(11),
   distid               int(11),
   primary key (id)
);

alter table t_district_user comment '描述一个片区归哪些操作员维护; 一个操作员能维护哪些片区';

/*==============================================================*/
/* table: t_equipment                                           */
/*==============================================================*/
create table t_equipment
(
   id                   int(11) not null auto_increment,
   name                 varchar(32),
   code                 varchar(64),
   type                 tinyint(4) comment '1水表、2电表',
   manufacturers        varchar(64),
   model                varchar(64),
   primary key (id)
);

/*==============================================================*/
/* table: t_record_pay                                          */
/*==============================================================*/
create table t_record_pay
(
   id                   int(11) not null auto_increment,
   accountid            int(11),
   paydate              datetime,
   money                int(11) comment '单位转换成分；直接用整数存储',
   surveyid             int(11) comment '针对哪条读数来缴费的',
   status               tinyint(1) comment '1缴清；2欠费；3预存',
   balance              int(11) comment '欠费或者预存的金额',
   primary key (id)
);

/*==============================================================*/
/* table: t_record_survey                                       */
/*==============================================================*/
create table t_record_survey
(
   id                   int(11) not null auto_increment,
   accountid            int(11),
   equipmentid          int(11) comment '记录账户设备使用情况表当前的id',
   type                 tinyint(4) comment '0更换设备自动写入；1平台录入；2移动端现场勘测；',
   value                double,
   readdate             datetime,
   createdate           datetime comment '一般用程序自动写入',
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_dict                                            */
/*==============================================================*/
create table t_sys_dict
(
   id                   int(11) not null auto_increment,
   code                 varchar(64),
   name                 varchar(64),
   type                 varchar(64),
   sort                 int(11),
   status               tinyint(1) comment '0：禁用；1：正常',
   primary key (id)
);

alter table t_sys_dict comment '配置数据字典';

/*==============================================================*/
/* table: t_sys_func                                            */
/*==============================================================*/
create table t_sys_func
(
   id                   int(11) not null auto_increment,
   name                 varchar(32),
   sort                 int(11),
   path                 varchar(512) comment '访问路径',
   pic                  varchar(512),
   pid                  int(11),
   type                 tinyint(4) comment '1：菜单；2：功能',
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_role                                            */
/*==============================================================*/
create table t_sys_role
(
   id                   int(11) not null auto_increment,
   name                 varchar(32),
   status               tinyint(1) comment '1正常； 0禁用',
   sort                 int(11),
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_role_func                                       */
/*==============================================================*/
create table t_sys_role_func
(
   id                   int(11) not null auto_increment,
   roleid               int(11),
   funcid               int(11),
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_user                                            */
/*==============================================================*/
create table t_sys_user
(
   id                   int(11) not null auto_increment,
   username             varchar(64) comment '用户名-登陆名',
   password             varchar(64) comment '登陆密码',
   nickname             varchar(64) comment '昵称',
   email                varchar(512) comment '电子邮箱',
   phone                varchar(64) comment '手机号码',
   status               tinyint(1) comment '状态：0未激活；1正常；2冻结',
   registerdate         datetime,
   registertype         tinyint(4) comment '注册方式：0管理员添加；1前台注册',
   usertype             tinyint(4) comment '1：普通用户；0：管理员',
   groupid              int(11),
   primary key (id)
);

alter table t_sys_user comment '用户主表';

/*==============================================================*/
/* table: t_sys_user_group                                      */
/*==============================================================*/
create table t_sys_user_group
(
   id                   int(11) not null auto_increment,
   name                 varchar(64) comment '用户组名',
   status               tinyint(1) comment '1正常；0禁用',
   sort                 int(11),
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_user_role                                       */
/*==============================================================*/
create table t_sys_user_role
(
   id                   int(11) not null auto_increment,
   userid               int(11),
   roleid               int(11),
   primary key (id)
);