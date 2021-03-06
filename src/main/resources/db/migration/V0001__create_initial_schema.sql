CREATE TABLE address(
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  street_name VARCHAR(40),
  city_name  VARCHAR(40),
  province_name VARCHAR(40),
  country_name VARCHAR(40),
  country_code  VARCHAR(5),
  postal_code  VARCHAR(10),
  coordinatex  VARCHAR(15),
  coordinatey  VARCHAR(15),
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE room(
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE owner(
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(40),
  lastname  VARCHAR(40),
  address_id BIGINT UNSIGNED,
  email  VARCHAR(40),
  cellphone  VARCHAR(40),
  course_id BIGINT UNSIGNED,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE medias(
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE attribute(
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  code VARCHAR(10),
  value VARCHAR(60),
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE booking(
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  owner_id  BIGINT UNSIGNED,
  date_from TIMESTAMP NOT NULL,
  date_to TIMESTAMP NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE payment(
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE courses(
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE checkpoint(
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  checkpoint_id INT UNSIGNED NOT NULL,
  name VARCHAR(40),
  description VARCHAR(40),
  type VARCHAR(10),
  condition_type VARCHAR(10),
  address_id BIGINT UNSIGNED,
  owner_id BIGINT UNSIGNED,
  attribute_id BIGINT UNSIGNED,
  room_id BIGINT UNSIGNED,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by VARCHAR(10) NOT NULL,
  CONSTRAINT fk_address_id FOREIGN KEY (address_id) REFERENCES address(id),
  CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owner(id),
  CONSTRAINT fk_amenity_id FOREIGN KEY (attribute_id) REFERENCES attribute(id),
  CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES room(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
