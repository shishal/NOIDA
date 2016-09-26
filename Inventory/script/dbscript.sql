CREATE SCHEMA `noida` ;
CREATE  TABLE users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(512) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));
CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));
INSERT INTO users(username,password,enabled) VALUES ('admin','$2a$10$cInPBbKm1DDIO0vMWW0qr.VdVRgIBrHuIcfheg7ggW2/p07EgS58O', true);
INSERT INTO users(username,password,enabled) VALUES ('user','$2a$10$h.4MUPdv5O.4ppeiXQhlouGAU8BSmD0ma7roXbcnHkcKRoH1EQGsy', true);
INSERT INTO users(username,password,enabled) VALUES ('approver','$2a$10$QNTbNytQiYFap9mDY9Q2SOFjLLHMrf3fXNny3/crGszvJjI9FOoZW', true);
INSERT INTO users(username,password,enabled) VALUES ('issuer','$2a$10$OqcAYAJ79i.XWUf9oKn0FOw/zlYdHFQW4MOB912CczuClOcb23cAG', true);

INSERT INTO user_roles (username, role) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('user', 'ROLE_USER');
INSERT INTO user_roles (username, role) VALUES ('ISSUER', 'ROLE_ISSUER');
INSERT INTO user_roles (username, role) VALUES ('APPROVER', 'ROLE_APPROVER');