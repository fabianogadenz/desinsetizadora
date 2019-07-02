const express = require('express');
const router = express.Router();

const UserController = require('../controllers/user.controller');
const passport = require('passport');

require('./../middleware/passport')(passport);

/**
    * @route POST /user
    * @group User - Operations about user
    * @param {string} login.required
    * @param {string} password.required
    * @param {string} email.required
    * @param {string} name
    * @param {string} phone
    * @param {DateOnly} dateofbirth - YYYY-MM-DD
    * @param {string} gender
    * @returns {object} 201 - Created User
    * @returns {Error}  default - Unexpected error
 */
router.post('/user', UserController.create);
/**
    * @route GET /user
    * @group User - Operations about user
    * @returns {object} 200 - User 
    * @returns {Error}  default - Unexpected error
    * @security JWT
 */
router.get('/user', passport.authenticate('jwt', { session: false }), UserController.get);
/**
    * @route GET /user/:id
    * @group User - Operations about user
    * @returns {object} 200 - User With ID 
    * @returns {Error}  default - Unexpected error
    * @security JWT
 */
router.get('/user/:id', passport.authenticate('jwt', { session: false }), UserController.getOne);
/**
    * @route GET /users
    * @group User - Operations about user
    * @returns {object} 200 - Array of Users
    * @returns {Error}  default - Unexpected error
    * @security JWT
 */
router.get('/users', passport.authenticate('jwt', { session: false }), UserController.getAll);
/**
    * @route PUT /user
    * @group User - Operations about user
    * @param {string} login.required
    * @param {string} password.required
    * @param {string} email.required
    * @param {string} name
    * @param {string} phone
    * @param {DateOnly} dateofbirth - YYYY-MM-DD
    * @param {string} gender
    * @returns {object} 200 - Updated User 
    * @returns {Error}  default - Unexpected error
    * @security JWT
 */
router.put('/user', passport.authenticate('jwt', { session: false }), UserController.update);
/**
    * @route PUT /user/:id
    * @group User - Operations about user
    * @param {string} login.required
    * @param {string} password.required
    * @param {string} email.required
    * @param {string} name
    * @param {string} phone
    * @param {DateOnly} dateofbirth - YYYY-MM-DD
    * @param {string} gender
    * @returns {object} 200 - Updated User 
    * @returns {Error}  default - Unexpected error
    * @security JWT
 */
router.put('/user/:id', passport.authenticate('jwt', { session: false }), UserController.updateOne);
/**
    * @route DELETE /user
    * @group User - Operations about user
    * @returns {object} 200 
    * @returns {Error}  default - Unexpected error
    * @security JWT
 */
router.delete('/user', passport.authenticate('jwt', { session: false }), UserController.remove);
/**
    * @route DELETE /user/:id
    * @group User - Operations about user
    * @returns {object} 200 
    * @returns {Error}  default - Unexpected error
    * @security JWT
 */
router.delete('/user/:id', passport.authenticate('jwt', { session: false }), UserController.del);
/**
    * @route POST /login
    * @group User - Operations about user
    * @param {string} login.required
    * @param {string} password.required
    * @param {string} email.required
    * @returns {object} 200 - Token 
    * @returns {Error}  default - Unexpected error
 */
router.post('/login', UserController.login);
/**
    * @route GET /verifytoken
    * @group User - Operations about user
    * @returns {object} 200 - TRUE or FALSE
    * @returns {Error}  default - Unexpected error
 */
router.get('/verifytoken', UserController.verifytoken);

router.get('*', function(req, res) {
    res.redirect('/api-docs')
})

module.exports = router;
