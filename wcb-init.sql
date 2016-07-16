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

alter table t_account comment 'ҵ���û�';

/*==============================================================*/
/* table: t_account_equipment                                   */
/*==============================================================*/
create table t_account_equipment
(
   id                   int(11) not null auto_increment,
   accountid            int(11),
   equipmentid          int(11),
   createdate           datetime,
   invaliddate          datetime comment '��������ʱ��',
   status               tinyint(1) comment '1��ǰ���ã�0����',
   primary key (id)
);

alter table t_account_equipment comment '�м��ϵ��';

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

alter table t_community comment 'С��';

/*==============================================================*/
/* table: t_district                                            */
/*==============================================================*/
create table t_district
(
   id                   int(11) not null auto_increment,
   name                 varchar(64) comment '���磺ĳĳС��',
   remark               varchar(512) comment '���磺12��',
   primary key (id)
);

alter table t_district comment '����Ա���û�Ӧ�ֳ�Ƭ�������� ���������:ˮ���û���';

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

alter table t_district_user comment '����һ��Ƭ������Щ����Աά��; һ������Ա��ά����ЩƬ��';

/*==============================================================*/
/* table: t_equipment                                           */
/*==============================================================*/
create table t_equipment
(
   id                   int(11) not null auto_increment,
   name                 varchar(32),
   code                 varchar(64),
   type                 tinyint(4) comment '1ˮ��2���',
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
   money                int(11) comment '��λת���ɷ֣�ֱ���������洢',
   surveyid             int(11) comment '��������������ɷѵ�',
   status               tinyint(1) comment '1���壻2Ƿ�ѣ�3Ԥ��',
   balance              int(11) comment 'Ƿ�ѻ���Ԥ��Ľ��',
   primary key (id)
);

/*==============================================================*/
/* table: t_record_survey                                       */
/*==============================================================*/
create table t_record_survey
(
   id                   int(11) not null auto_increment,
   accountid            int(11),
   equipmentid          int(11) comment '��¼�˻��豸ʹ�������ǰ��id',
   type                 tinyint(4) comment '0�����豸�Զ�д�룻1ƽ̨¼�룻2�ƶ����ֳ����⣻',
   value                double,
   readdate             datetime,
   createdate           datetime comment 'һ���ó����Զ�д��',
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
   status               tinyint(1) comment '0�����ã�1������',
   primary key (id)
);

alter table t_sys_dict comment '���������ֵ�';

/*==============================================================*/
/* table: t_sys_func                                            */
/*==============================================================*/
create table t_sys_func
(
   id                   int(11) not null auto_increment,
   name                 varchar(32),
   sort                 int(11),
   path                 varchar(512) comment '����·��',
   pic                  varchar(512),
   pid                  int(11),
   type                 tinyint(4) comment '1���˵���2������',
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_role                                            */
/*==============================================================*/
create table t_sys_role
(
   id                   int(11) not null auto_increment,
   name                 varchar(32),
   status               tinyint(1) comment '1������ 0����',
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
   username             varchar(64) comment '�û���-��½��',
   password             varchar(64) comment '��½����',
   nickname             varchar(64) comment '�ǳ�',
   email                varchar(512) comment '��������',
   phone                varchar(64) comment '�ֻ�����',
   status               tinyint(1) comment '״̬��0δ���1������2����',
   registerdate         datetime,
   registertype         tinyint(4) comment 'ע�᷽ʽ��0����Ա��ӣ�1ǰ̨ע��',
   usertype             tinyint(4) comment '1����ͨ�û���0������Ա',
   groupid              int(11),
   primary key (id)
);

alter table t_sys_user comment '�û�����';

/*==============================================================*/
/* table: t_sys_user_group                                      */
/*==============================================================*/
create table t_sys_user_group
(
   id                   int(11) not null auto_increment,
   name                 varchar(64) comment '�û�����',
   status               tinyint(1) comment '1������0����',
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

