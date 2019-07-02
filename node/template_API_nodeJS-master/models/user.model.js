const jwt = require('jsonwebtoken');
const { TE, to } = require('../services/util.service');
const CONFIG = require('../config/config');
const bcrypt = require('bcrypt');

module.exports = (sequelize, DataTypes) => {
	/**
        * @typedef User
        * @property {integer} id
        * @property {string} login.required
        * @property {string} password.required
        * @property {string} email.required
        * @property {string} name
        * @property {string} phone
        * @property {DateOnly} dateofbirth - YYYY-MM-DD
        * @property {string} gender
        * @property {bool} administrator
     */
	var Model = sequelize.define('User', {
		login: DataTypes.STRING,
		password: DataTypes.STRING,
		email: DataTypes.STRING,
		name: DataTypes.STRING,
		phone: DataTypes.STRING,
		dateofbirth: DataTypes.STRING,
		gender: DataTypes.STRING,
		administrator: DataTypes.BOOLEAN
	});

	Model.beforeSave(async (user, options) => {
		if (user.changed('password')) {
			[ err, hash ] = await to(bcrypt.hash(user.password, CONFIG.jwt_salt));
			if (err != null) TE('Erro Ao Gerar Hash');
			user.password = hash;
		}
	});

	Model.prototype.comparePassword = async function(pw) {
		if (!this.password) TE('A Senha Não Foi Inserida');
		const match = await bcrypt.compare(pw, this.password);
		if (!match) TE('Senha Invalida');
		return this;
	};

	Model.prototype.getJWT = function() {
		let expiration_time = parseInt(CONFIG.jwt_expiration);
		return (
			'Bearer ' +
			jwt.sign({ user_id: this.id }, CONFIG.jwt_encryption, {
				expiresIn: expiration_time
			})
		);
	};

	Model.prototype.toWeb = function(pw) {
		let json = this.toJSON();
		return json;
	};

	return Model;
};
