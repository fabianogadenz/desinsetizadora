require("dotenv").config();
let CONFIG = {};

CONFIG.app = process.env.APP || "dev";
CONFIG.port = process.env.PORT || "3000";

CONFIG.db_dialect = process.env.DB_DIALECT || "mysql";
CONFIG.db_host = "localhost";
CONFIG.db_port = "3306";
CONFIG.db_name = "dedetizadora";
CONFIG.db_user = "root";
CONFIG.db_password = "SUASENHA";

CONFIG.jwt_encryption = process.env.JWT_ENCRYPTION || "jwt_please_change";
CONFIG.jwt_salt = process.env.JWT_SALT || 10;
CONFIG.jwt_expiration = process.env.JWT_EXPIRATION || "2592000";

module.exports = CONFIG;