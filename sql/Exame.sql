create table exame
(
	id mediumint(8) unsigned not null primary key auto_increment,
	paciente varchar(200) not null,
	medico varchar(200) not null,
	observacao text null
);