function authenticateSession(req, res, next) {
    if (req.session.userId) {
        next();
    } else {
        res.status(401).send('Unauthorized');
    }
}
