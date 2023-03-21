DROP TABLE IF exists vault_transaction;
DROP TABLE IF EXISTS vault;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS machines;

create table machines (
  machine_pk INT NOT NULL AUTO_INCREMENT,
  machine_name VARCHAR(255) not null,
  model VARCHAR(50) not null,
  machine_location VARCHAR(255),
  PRIMARY KEY (machine_pk)
);

create table employees (
  employee_pk INT NOT NULL AUTO_INCREMENT,
  employee_name VARCHAR(255) not null,
  employee_id int not null,
  PRIMARY KEY (employee_pk)
);

create table vault(
  vault_pk INT NOT NULL AUTO_INCREMENT,
  machine_fk int NOT NULL,
  One_dollar INT,
  Two_dollars INT,
  Five_dollars INT,
  Ten_dollars INT,
  Twenty_dollars INT,
  Fifty_dollars INT,
  one_hundred_dollars INT,
  pennies DECIMAL(10,2),
  nickels DECIMAL(10,2),
  dimes DECIMAL(10,2),
  quarters_cent DECIMAL(10,2),
  half_dollars DECIMAL(10,2),
  dollar_coins int,
  vault_total DECIMAL(10,2),
  primary key (vault_pk),
  FOREIGN KEY (machine_fk) REFERENCES machines (machine_pk) ON DELETE CASCADE
  );


create table vault_transaction (
  transaction_pk INT NOT NULL AUTO_INCREMENT, 
  employee_fk INT NOT NULL,
  vault_fk INT NOT null,
  transaction_date DATE NOT NULL,
  transaction_type enum('fill vault', 'empty vault'),  
  PRIMARY KEY (transaction_pk),
  FOREIGN KEY (employee_fk) REFERENCES employees (employee_pk) ON DELETE cascade,
  FOREIGN KEY (vault_fk) REFERENCES vault (vault_pk) ON DELETE CASCADE
);